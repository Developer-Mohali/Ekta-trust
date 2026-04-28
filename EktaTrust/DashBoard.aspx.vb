Imports System.Globalization
Imports MySql.Data.MySqlClient

Public Class DashBoard
    Inherits System.Web.UI.Page
    Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            'If Session("RoleId") IsNot Nothing Then
            '    Dim roleId As Integer = Convert.ToInt32(Session("RoleId"))
            '    divShowHideMenu.Visible = (roleId <> 3)
            'Else
            '    divShowHideMenu.Visible = True
            'End If
            LoadSummaryCards()
            LoadChartData()
            LoadBIBChartData()
        End If
    End Sub

    Private Sub LoadSummaryCards()
        Try
            Using con As New MySqlConnection(constr)
                Using cmd As New MySqlCommand("sp_GetDashboardSummary", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    con.Open()
                    Dim reader As MySqlDataReader = cmd.ExecuteReader()

                    If reader.Read() Then
                        ' Retrieve values using the aliases we set in the stored procedure
                        Dim totalUsers As Integer = Convert.ToInt32(reader("TotalUsers"))
                        Dim totalVisitor As Integer = Convert.ToInt32(reader("TotalVisitor"))
                        Dim totalDonations As Decimal = If(IsDBNull(reader("TotalDonations")), 0, Convert.ToDecimal(reader("TotalDonations")))

                        ' Bind the data to the labels and format them beautifully
                        ' "N0" adds thousand separators (e.g., 1,245)
                        ' "C0" formats as currency with no decimals (e.g., $45,250)
                        lblTotalUsers.Text = totalUsers.ToString("N0")
                        lblTotalVisitor.Text = totalVisitor.ToString("N0")
                        lblTotalDonations.Text = totalDonations.ToString("C0", CultureInfo.CreateSpecificCulture("hi-IN"))
                    End If
                End Using
            End Using
        Catch ex As Exception
            Throw
        End Try
    End Sub

    Private Sub LoadChartData()
        Try
            Dim monthLabels As New List(Of String)()
            ' Dictionaries to ensure we have a value for every month
            Dim successData As New Dictionary(Of String, Decimal)()
            Dim failedData As New Dictionary(Of String, Decimal)()
            Dim cancelledData As New Dictionary(Of String, Decimal)()

            ' Initialize last 6 months with 0s
            For i As Integer = 5 To 0 Step -1
                Dim monthName As String = DateTime.Now.AddMonths(-i).ToString("MMM")
                monthLabels.Add("'" & monthName & "'")
                successData(monthName) = 0
                failedData(monthName) = 0
                cancelledData(monthName) = 0
            Next

            Using conn As New MySqlConnection(constr)
                Using cmd As New MySqlCommand("sp_GetMonthlyDonationTrend", conn)
                    cmd.CommandType = CommandType.StoredProcedure
                    conn.Open()
                    Dim reader As MySqlDataReader = cmd.ExecuteReader()
                    While reader.Read()
                        Dim mName As String = reader("MonthName").ToString()
                        If successData.ContainsKey(mName) Then
                            successData(mName) = Convert.ToDecimal(reader("SuccessTotal"))
                            failedData(mName) = Convert.ToDecimal(reader("FailedTotal"))
                            cancelledData(mName) = Convert.ToDecimal(reader("CancelledTotal"))
                        End If
                    End While
                End Using
            End Using

            ' Join the dictionary values into comma-separated strings
            Dim labelsArr As String = String.Join(",", monthLabels)
            Dim successArr As String = String.Join(",", successData.Values)
            Dim failedArr As String = String.Join(",", failedData.Values)
            Dim cancelledArr As String = String.Join(",", cancelledData.Values)

            RenderChart(labelsArr, successArr, failedArr, cancelledArr)
        Catch ex As Exception
            Throw
        End Try
    End Sub
    Private Sub RenderChart(labels As String, success As String, failed As String, cancelled As String)
        ' Build the JavaScript to render the chart
        Dim script As String = "
                <script>
                    document.addEventListener('DOMContentLoaded', function() {
                        const ctx = document.getElementById('myDonationChart').getContext('2d');
                        new Chart(ctx, {
                            type: 'bar', // You can change this to 'line', 'pie', etc.
                            data: {
                                labels: [" & labels & "],
                                datasets: [
                                    {
                                        label: 'Success',
                                        data: [" & success & "],
                                        backgroundColor: '#28a745'
                                    },
                                    {
                                        label: 'Failed',
                                        data: [" & failed & "],
                                        backgroundColor: '#dc3545'
                                    },
                                    {
                                        label: 'Cancelled',
                                        data: [" & cancelled & "],
                                        backgroundColor: '#ffc107'
                                    }
                                ]
                            },
                            options: {
                                responsive: true,
                                plugins: {
                                    legend: { position: 'top' }
                                },
                                scales: {
                                    y: { 
                                        beginAtZero: true,
                                        ticks: { callback: function(value) { return '₹' + value; } }
                                    }
                                }
                            }
                        });
                    });
                </script>"

        ' Inject the script into the Literal control on the page
        ChartScriptLiteral.Text = script
    End Sub

    Private Sub LoadBIBChartData()
        Try
            Dim statusLabels As New List(Of String)()
            Dim statusCounts As New List(Of Integer)()

            Using conn As New MySqlConnection(constr)
                ' Query to get total counts for the current year
                Dim sql As String = "SELECT PaymentStatus, COUNT(*) as TotalCount FROM bibdata " &
                            "WHERE YEAR = YEAR(CURDATE()) AND IFNULL(IsDeleted, 0) = 0 " &
                            "GROUP BY PaymentStatus"

                Using cmd As New MySqlCommand(sql, conn)
                    conn.Open()
                    Dim reader As MySqlDataReader = cmd.ExecuteReader()

                    While reader.Read()
                        ' Wrap status in single quotes for JS
                        statusLabels.Add("'" & reader("PaymentStatus").ToString() & "'")
                        statusCounts.Add(Convert.ToInt32(reader("TotalCount")))
                    End While
                End Using
            End Using

            ' Convert to strings for JavaScript injection
            Dim labelsJS As String = String.Join(",", statusLabels)
            Dim countsJS As String = String.Join(",", statusCounts)

            RenderBIBUserChart(labelsJS, countsJS)
        Catch ex As Exception
            Throw
        End Try
    End Sub
    Private Sub RenderBIBUserChart(labels As String, data As String)
        ' This script targets a new canvas ID: myPieChart
        regUserLiteral.Text = "
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const ctx = document.getElementById('regUserChart').getContext('2d');
            new Chart(ctx, {
                type: 'pie',
                data: {
                    labels: [" & labels & "],
                    datasets: [{
                        data: [" & data & "],
                        backgroundColor: [
                            '#28a745', // Green for Success
                            '#dc3545', // Red for Failed
                            '#ffc107', // Yellow for Cancelled
                            '#17a2b8'  // Blue for others
                        ],
                        borderWidth: 1
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: { position: 'bottom' },
                        title: {
                            display: true,
                            text: 'Yearly BIB Data Status Distribution (" & DateTime.Now.Year.ToString() & ")'
                        }
                    }
                }
            });
        });
    </script>"
    End Sub
End Class