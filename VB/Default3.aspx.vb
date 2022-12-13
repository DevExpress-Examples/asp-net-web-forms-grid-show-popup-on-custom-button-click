Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.Web

Partial Public Class Default3
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

    End Sub

Protected Sub gv_CustomButtonCallback(ByVal sender As Object, ByVal e As ASPxGridViewCustomButtonCallbackEventArgs)
    Dim grid As ASPxGridView = DirectCast(sender, ASPxGridView)
    Dim keyValue As String = grid.GetRowValues(e.VisibleIndex, "EmployeeID").ToString()
    Session("EmployeeID") = keyValue
    CType(PopupControlContentControl1.FindControl("popupGv"), ASPxGridView).DataBind()
    popup.ShowOnPageLoad = True
End Sub
End Class