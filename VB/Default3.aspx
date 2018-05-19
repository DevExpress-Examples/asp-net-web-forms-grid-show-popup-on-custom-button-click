<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default3.aspx.vb" Inherits="Default3" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.12.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.12.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.12.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.12.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.12.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>How to show ASPxPopupControl on the ASPxGridView's CustomButton CallBack when ASPxGridView.EnableCallBacks is false</title>
</head>
<body>
    <form id="form1" runat="server">
    <dx:ASPxPopupControl ID="popup" ClientInstanceName="popup" runat="server" AllowDragging="true"
        HeaderText="Photo & Notes" Width="320">
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                <dx:ASPxGridView ID="popupGv" runat="server" DataSourceID="popupDs">
                </dx:ASPxGridView>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    <dx:ASPxGridView ID="gv" runat="server" ClientInstanceName="gv" DataSourceID="ads"
        KeyFieldName="EmployeeID" OnCustomButtonCallback="gv_CustomButtonCallback" EnableCallBacks="false">
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
    <dx:ASPxButton ID="btn" runat="server" Text="PostBack">
    </dx:ASPxButton>
    <asp:AccessDataSource ID="ads" runat="server" DataFile="~/App_Data/nwind.mdb" SelectCommand="SELECT [EmployeeID], [LastName], [FirstName] FROM [Employees]">
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="popupDs" runat="server" DataFile="~/App_Data/nwind.mdb"
        SelectCommand="SELECT [OrderID], [ShipName], [ShipAddress] FROM [Orders] WHERE ([EmployeeID] = ?)">
        <SelectParameters>
            <asp:SessionParameter Name="EmployeeID" SessionField="EmployeeID" Type="Int32" />
        </SelectParameters>
    </asp:AccessDataSource>
    </form>
</body>
</html>