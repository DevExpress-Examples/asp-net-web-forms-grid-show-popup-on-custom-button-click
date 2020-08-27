<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>How to show ASPxPopupControl on the ASPxGridView's CustomButton click</title>
</head>
<body>
    <form id="form1" runat="server">
    <dx:ASPxHyperLink ID="lnk1" runat="server" Text="How to show ASPxPopupControl on the ASPxGridView's CustomButton client-side click"
        NavigateUrl="Default1.aspx">
    </dx:ASPxHyperLink>
    <br />
    <dx:ASPxHyperLink ID="lnk2" runat="server" Text="How to show ASPxPopupControl on the ASPxGridView's CustomButton CallBack"
        NavigateUrl="Default2.aspx">
    </dx:ASPxHyperLink>
    <br />
    <dx:ASPxHyperLink ID="lnk3" runat="server" Text="How to show ASPxPopupControl on the ASPxGridView's CustomButton CallBack when ASPxGridView.EnableCallBacks is false"
        NavigateUrl="Default3.aspx">
    </dx:ASPxHyperLink>
    </form>
</body>
</html>
