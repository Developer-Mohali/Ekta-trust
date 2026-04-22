<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Admin.Master" CodeBehind="Winners.aspx.vb" Inherits="EktaTrust.Winners" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <style>
        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
            margin-top: 50px;
            /*margin-left: 50px;*/
        }

        caption {
            font-family: Arial,serif;
            font-size: 22px;
            text-transform:uppercase;
            font-size:22px;
            text-decoration:underline;
        }

        td, th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
            font-size: 16px;
        }


.panel-heading a {
  display: block;
  position: relative;
  font-weight: bold;
  
  &::after {
    content: "";
    border: solid #4e4e4e;
    border-width: 0 3px 3px 0;
    display: inline-block;
    padding: 5px;
    position: absolute;
    right: 0;
    top: 0;
    transform: rotate(45deg);
  }

  &[aria-expanded="true"]::after {
    transform: rotate(-135deg);
    top: 5px;
  }

        /*tr:nth-child(even) {
  background-color: #dddddd;
}*/
    </style>

    <div class="container">

        <div class="jquery-script-ads" style="margin: 6px auto;">
            <h2 class="wow fadeInDown">List Of Winners for Run For Equlity</h2>
            <hr class="row marginImage" style="border: 1px dotted orange;" />

        </div>

          <div class="panel-group" id="accordion">
               <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse2025">2025 Winner List</a>
                        </h4>
                    </div>
                      <div id="collapse2025" class="panel-collapse collapse in">
                        <div class="panel-body" style="color: #333;">
                           <div class="table-responsive">
                            <table class="table">
                                <caption>21KM Winner Candidates List(Male)</caption>
                                <tr>
                                    <th>S.No</th>
                                    <th>BIB Number</th>
                                    <th>Name</th>
                                    <th>Start</th>
                                    <th>End</th>
                                    <th>Net Time</th>
                                </tr>
                                <tr>
                                    <td colspan="6" style="text-align:center">Updating Soon</td>
                                </tr>

                            </table>
                        </div>


                        <div class="table-responsive">

                            <table class="table">
                                <caption>21KM Winner Candidates List(Female)</caption>
                                <tr>
                                     <th>S.No</th>
                                    <th>BIB Number</th>
                                    <th>Name</th>
                                    <th>Start</th>
                                    <th>End</th>
                                     <th>Net Time</th>
                                </tr>
                                <tr>
                                     <td colspan="6" style="text-align:center">Updating Soon</td>
                                 </tr>

                            </table>
                        </div>

                        <div class="table-responsive">
                            <table class="table ">
                                <caption>10KM Winner Candidates List(Male)</caption>
                                <tr>
                                     <th>S.No</th>
                                    <th>BIB Number</th>
                                    <th>Name</th>
                                    <th>Start</th>
                                    <th>End</th>
                                     <th>Net Time</th>
                                </tr>
                                 <tr>
                                     <td colspan="6" style="text-align:center">Updating Soon</td>
                                 </tr>

                            </table>

                        </div>


                        <div class="table-responsive">
                            <table class="table ">
                                <caption>10KM Winner Candidates List(Female)</caption>
                                <tr>
                                    <th>S.No</th>
                                    <th>BIB Number</th>
                                    <th>Name</th>
                                    <th>Start</th>
                                    <th>End</th>
                                    <th>Net Time</th>
                                </tr>
                                <tr>
                                     <td colspan="6" style="text-align:center">Updating Soon</td>
                                 </tr>

                            </table>
                        </div>

                        <div class="table-responsive">
                            <table class="table ">
                                <caption>5KM Winner Candidates List(Male)</caption>
                                <tr>
                                    <th>S.No</th>
                                    <th>BIB Number</th>
                                    <th>Name</th>
                                    <th>Start</th>
                                    <th>End</th>
                                    <th>Net Time</th>
                                </tr>
                               <tr>
                                     <td colspan="6" style="text-align:center">Updating Soon</td>
                                 </tr>
                            </table>
                        </div>

                        <div class="table-responsive">
                        <table class="table ">
                            <caption>5KM Winner Candidates List(Female)</caption>
                            <tr>
                                <th>S.No</th>
                                <th>BIB Number</th>
                                <th>Name</th>
                                <th>Start</th>
                                <th>End</th>
                                 <th>Net Time</th>
                            </tr>
                             <tr>
                                 <td colspan="6" style="text-align:center">Updating Soon</td>
                             </tr>

                        </table>

                        </div>
                        </div>
                    </div>
                  </div>
               <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse2023">2023 Winner List</a>
                        </h4>
                    </div>
                       <div id="collapse2023" class="panel-collapse collapse">
                          <div class="panel-body" style="color: #333;">
                                <div class="table-responsive">
                                    <table class="table">
                                        <caption>21KM Winner Candidates List(Male)</caption>
                                        <tr>
                                            <th>S.No</th>
                                            <th>BIB Number</th>
                                            <th>Name</th>
                                            <th>Start</th>
                                            <th>End</th>
                                            <th>Net Time</th>
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>2162</td>
                                            <td>James kipleting</td>
                                            <td>04:16:31</td>
                                            <td>05:26:18</td>
                                            <td>01:09:47</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>2143</td>
                                            <td>Ashok Singh</td>
                                            <td>04:16:34</td>
                                            <td>05:37:05</td>
                                            <td>01:20:31</td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>2161</td>
                                            <td>Alok sharma</td>
                                            <td>04:16:30</td>
                                            <td>05:39:13</td>
                                            <td>01:22:43</td>
                                        </tr>

                                    </table>
                                </div>


                                <div class="table-responsive">

                                    <table class="table">
                                        <caption>21KM Winner Candidates List(Female)</caption>
                                        <tr>
                                             <th>S.No</th>
                                            <th>BIB Number</th>
                                            <th>Name</th>
                                            <th>Start</th>
                                            <th>End</th>
                                             <th>Net Time</th>
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>2163</td>
                                            <td>Kimitwai</td>
                                            <td>04:16:31</td>
                                            <td>05:50:47</td>
                                            <td>01:34:16</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>2143</td>
                                            <td>Ashok Singh</td>
                                            <td>04:16:31</td>
                                            <td>05:58:58</td>
                                            <td>01:42:27</td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>2133</td>
                                            <td>Sudha khandelwal</td>
                                            <td>04:18:40</td>
                                            <td>06:45:55</td>
                                            <td>02:27:15</td>
                                        </tr>

                                    </table>
                                </div>

                                <div class="table-responsive">
                                    <table class="table ">
                                        <caption>10KM Winner Candidates List(Male)</caption>
                                        <tr>
                                             <th>S.No</th>
                                            <th>BIB Number</th>
                                            <th>Name</th>
                                            <th>Start</th>
                                            <th>End</th>
                                             <th>Net Time</th>
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>1042</td>
                                            <td>Yogesh</td>
                                            <td>05:25:16</td>
                                            <td>06:01:07</td>
                                            <td>00:35:51</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>1047</td>
                                            <td>Harendra Mudiya</td>
                                            <td>05:25:17</td>
                                            <td>06:04:52</td>
                                            <td>00:39:35</td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>1023</td>
                                            <td>Darmesh</td>
                                            <td>05:25:16</td>
                                            <td>06:16:53</td>
                                            <td>00:51:37</td>
                                        </tr>

                                    </table>

                                </div>


                                <div class="table-responsive">
                                    <table class="table ">
                                        <caption>10KM Winner Candidates List(Female)</caption>
                                        <tr>
                                            <th>S.No</th>
                                            <th>BIB Number</th>
                                            <th>Name</th>
                                            <th>Start</th>
                                            <th>End</th>
                                            <th>Net Time</th>
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>1014</td>
                                            <td>Priyushi Sharma</td>
                                            <td>05:25:16</td>
                                            <td>06:16:21</td>
                                            <td>00:55:05</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>1034</td>
                                            <td>Saina Insan</td>
                                            <td>05:25:26</td>
                                            <td>06:21:19</td>
                                            <td>00:55:53</td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>1021</td>
                                            <td>Manju Pareek</td>
                                            <td>05:25:19</td>
                                            <td>06:22:27</td>
                                            <td>00:57:08</td>
                                        </tr>

                                    </table>
                                </div>

                                <div class="table-responsive">
                                    <table class="table ">
                                        <caption>5KM Winner Candidates List(Male)</caption>
                                        <tr>
                                            <th>S.No</th>
                                            <th>BIB Number</th>
                                            <th>Name</th>
                                            <th>Start</th>
                                            <th>End</th>
                                            <th>Net Time</th>
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>5033</td>
                                            <td>Manoj Kumar</td>
                                            <td>05:50:24</td>
                                            <td>06:04:46</td>
                                            <td>00:14:22</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>5357</td>
                                            <td>Lokesh Choudhary</td>
                                            <td>05:50:24</td>
                                            <td>06:06:12</td>
                                            <td>00:15:48</td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>5031</td>
                                            <td>Aviral Tiwari</td>
                                            <td>05:50:23</td>
                                            <td>06:06:19</td>
                                            <td>00:15:56</td>
                                        </tr>

                                    </table>
                                </div>

                                <div class="table-responsive">

            <table class="table ">
                <caption>5KM Winner Candidates List(Female)</caption>
                <tr>
                    <th>S.No</th>
                    <th>BIB Number</th>
                    <th>Name</th>
                    <th>Start</th>
                    <th>End</th>
                     <th>Net Time</th>
                </tr>
                <tr>
                    <td>1</td>
                    <td>5320</td>
                    <td>Jeevashree Bane</td>
                    <td>05:50:27</td>
                    <td>06:22:07</td>
                    <td>00:31:40</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>5273</td>
                    <td>Dr Kiran Bala</td>
                    <td>05:50:28</td>
                    <td>06:26:10</td>
                    <td>00:35:42</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>5358</td>
                    <td>Nidhi Tolani</td>
                    <td>05:50:27</td>
                    <td>06:28:44</td>
                    <td>00:38:17</td>
                </tr>

            </table>

        </div>
                          </div>
                      </div>
                   </div>
           </div>
    </div>



</asp:Content>
