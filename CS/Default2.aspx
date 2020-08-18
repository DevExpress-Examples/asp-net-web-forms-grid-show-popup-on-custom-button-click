<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>How to show ASPxPopupControl on the ASPxGridView's CustomButton CallBack</title>
    <style type="text/css">
        .Image
        {
            padding-right: 10px;
        }
    </style>
    <script type="text/javascript">
    	function OnEndCallback(s, e) {
    		if (!gv.cpKeyValue)
    			return;
            popup.Show();
            popup.PerformCallback(gv.cpKeyValue);
            gv.cpKeyValue = null;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <dx:ASPxPopupControl ID="popup" ClientInstanceName="popup" runat="server" AllowDragging="true"
        HeaderText="Photo & Notes" OnWindowCallback="popup_WindowCallback" Width="320">
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
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
        KeyFieldName="EmployeeID" oncustombuttoncallback="gv_CustomButtonCallback">
        <ClientSideEvents EndCallback="OnEndCallback" />
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
		<SettingsPager PageSize="5"></SettingsPager>
    </dx:ASPxGridView>
    <asp:AccessDataSource ID="ads" runat="server" DataFile="~/App_Data/nwind.mdb" SelectCommand="SELECT [EmployeeID], [LastName], [FirstName] FROM [Employees]">
    </asp:AccessDataSource>
    </form>
</body>
</html>
