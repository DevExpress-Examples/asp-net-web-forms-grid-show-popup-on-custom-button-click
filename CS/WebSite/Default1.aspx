<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default1.aspx.cs" Inherits="Default1" %>

<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>How to show ASPxPopupControl on the ASPxGridView's CustomButton client-side click</title>
    <style type="text/css">
        .Image
        {
            padding-right: 10px;
        }
    </style>
    <script type="text/javascript">
        function OnCustomButtonClick(s, e) {
            OnDetailsClick(gv.GetRowKey(e.visibleIndex))
        }

        function OnDetailsClick(keyValue) {
            popup.Show();
            popup.PerformCallback(keyValue);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <dx:ASPxPopupControl ID="popup" ClientInstanceName="popup" runat="server" AllowDragging="true"
        HeaderText="Photo & Notes" OnWindowCallback="popup_WindowCallback" Width="320">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <table>
                    <tr>
                        <td>
                            <dx:ASPxBinaryImage ID="edBinaryImage" runat="server" AlternateText="Loading..."
                                ImageAlign="Left" CssClass="Image">
                            </dx:ASPxBinaryImage>
                            <asp:Literal ID="litText" runat="server" Text=""></asp:Literal>
                        </td>
                    </tr>
                </table>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    <dx:ASPxGridView ID="gv" runat="server" ClientInstanceName="gv" DataSourceID="ads"
        KeyFieldName="EmployeeID">
        <Columns>
            <dx:GridViewDataColumn FieldName="EmployeeID" VisibleIndex="1" />
            <dx:GridViewDataColumn FieldName="FirstName" VisibleIndex="2" />
            <dx:GridViewDataColumn FieldName="LastName" VisibleIndex="3" />
            <dx:GridViewCommandColumn VisibleIndex="4">
                <CustomButtons>
                    <dx:GridViewCommandColumnCustomButton ID="btnDetails" Text="Details" />
                </CustomButtons>
            </dx:GridViewCommandColumn>
        </Columns>
        <ClientSideEvents CustomButtonClick="OnCustomButtonClick" />
    </dx:ASPxGridView>
    <asp:AccessDataSource ID="ads" runat="server" DataFile="~/App_Data/nwind.mdb" SelectCommand="SELECT [EmployeeID], [LastName], [FirstName] FROM [Employees]">
    </asp:AccessDataSource>
    </form>
</body>
</html>
