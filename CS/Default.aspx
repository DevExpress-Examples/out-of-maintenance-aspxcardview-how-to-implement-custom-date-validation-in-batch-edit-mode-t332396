<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <script type="text/javascript">
            function OnValidation(s, e) {
                if (!clientChkb.GetChecked()) {
                    return;
                }
                var grid = ASPxClientCardView.Cast(s);
                var cellInfo1 = e.validationInfo[grid.GetColumnByField("BirthDate").index];
                var cellInfo2 = e.validationInfo[grid.GetColumnByField("HireDate").index];
                var years = CheckYears(cellInfo1.value, cellInfo2.value);
                if (years == null || years < 18) {
                    cellInfo1.isValid = false;
                    cellInfo2.isValid = false;
                    cellInfo2.errorText = "Invalid difference between Hire Date and Birth Date";
                    cellInfo1.errorText = "Invalid difference between Hire Date and Birth Date";
                } else {
                    cellInfo1.isValid = true;
                    cellInfo2.isValid = true;
                }
            }
            function CheckYears(date1, date2) {
                if (!date1 || !date2)
                    return null;
                var msecPerYear = 1000 * 60 * 60 * 24 * 365;
                var years = (date2.getTime() - date1.getTime()) / msecPerYear;
                return years;
            }
        </script>
    <div>
        <dx:ASPxCheckBox ID="ASPxCheckBox1" runat="server" ClientInstanceName="clientChkb"
            Checked="true" Text="ClientValidation">
        </dx:ASPxCheckBox>
        <dx:ASPxCheckBox runat="server" ID="ASPxCheckBox2" AutoPostBack="true" OnCheckedChanged="ASPxCheckBox2_CheckedChanged" Checked="false" Text="Validate on the Save Changes button click"></dx:ASPxCheckBox>
        <dx:ASPxCardView ClientInstanceName="grid" DataSourceID="AccessDataSource1" KeyFieldName="EmployeeID" ID="ASPxCardView1" OnCardValidating="ASPxCardView1_CardValidating" runat="server" AutoGenerateColumns="False">
            <SettingsEditing Mode="Batch">
            </SettingsEditing>
            <Columns>
                <dx:CardViewTextColumn FieldName="EmployeeID" ReadOnly="True" VisibleIndex="0">
                </dx:CardViewTextColumn>
                <dx:CardViewTextColumn FieldName="LastName" VisibleIndex="1">
                </dx:CardViewTextColumn>
                <dx:CardViewTextColumn FieldName="FirstName" VisibleIndex="2">
                </dx:CardViewTextColumn>
                <dx:CardViewTextColumn FieldName="Address" VisibleIndex="3">
                </dx:CardViewTextColumn>
                <dx:CardViewDateColumn FieldName="BirthDate" VisibleIndex="4" Width="120px">
                </dx:CardViewDateColumn>
                <dx:CardViewDateColumn FieldName="HireDate" VisibleIndex="6" Width="120px">
                </dx:CardViewDateColumn>
            </Columns>
            <CardLayoutProperties>
                <Items>
                    <dx:CardViewCommandLayoutItem HorizontalAlign="Right" ShowNewButton="True">
                    </dx:CardViewCommandLayoutItem>
                    <dx:CardViewColumnLayoutItem ColumnName="EmployeeID">
                    </dx:CardViewColumnLayoutItem>
                    <dx:CardViewColumnLayoutItem ColumnName="LastName">
                    </dx:CardViewColumnLayoutItem>
                    <dx:CardViewColumnLayoutItem ColumnName="FirstName">
                    </dx:CardViewColumnLayoutItem>
                    <dx:CardViewColumnLayoutItem ColumnName="Address">
                    </dx:CardViewColumnLayoutItem>
                    <dx:CardViewColumnLayoutItem ColumnName="BirthDate">
                    </dx:CardViewColumnLayoutItem>
                    <dx:CardViewColumnLayoutItem ColumnName="HireDate">
                    </dx:CardViewColumnLayoutItem>
                    <dx:EditModeCommandLayoutItem HorizontalAlign="Right">
                    </dx:EditModeCommandLayoutItem>
                </Items>
            </CardLayoutProperties>
            <ClientSideEvents BatchEditCardValidating="OnValidation" />
        </dx:ASPxCardView>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [Address], [BirthDate], [HireDate] FROM [Employees]"></asp:AccessDataSource>        
    </div>

    </form>
</body>
</html>
