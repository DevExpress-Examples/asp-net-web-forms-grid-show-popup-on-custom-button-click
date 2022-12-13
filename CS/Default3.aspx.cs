using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

public partial class Default3 : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {
        
    }

protected void gv_CustomButtonCallback(object sender, ASPxGridViewCustomButtonCallbackEventArgs e) {
    ASPxGridView grid = (ASPxGridView)sender;
    string keyValue = grid.GetRowValues(e.VisibleIndex, "EmployeeID").ToString();
    Session["EmployeeID"] = keyValue;
    ((ASPxGridView)PopupControlContentControl1.FindControl("popupGv")).DataBind();
    popup.ShowOnPageLoad = true;
}
}