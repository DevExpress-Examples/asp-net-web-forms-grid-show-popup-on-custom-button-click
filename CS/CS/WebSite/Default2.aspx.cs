using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxGridView;
using DevExpress.Web.ASPxPopupControl;

public partial class Default2 : System.Web.UI.Page {
    private byte[] image;
    private object note;

    protected void gv_CustomButtonCallback(object sender, ASPxGridViewCustomButtonCallbackEventArgs e) {
        ASPxGridView grid = (ASPxGridView)sender;
        string keyValue = grid.GetRowValues(e.VisibleIndex, "EmployeeID").ToString();
        gv.JSProperties["cpKeyValue"] = keyValue;
    }

    protected void popup_WindowCallback(object source, PopupWindowCallbackArgs e) {
        GetData(e.Parameter);
        edBinaryImage.Value = image;
        litText.Text = note.ToString();
    }

    private void GetData(string id) {
        AccessDataSource ds = new AccessDataSource();
        ds.DataFile = ads.DataFile;
        ds.SelectCommand = string.Format("Select Photo, Notes FROM [Employees] WHERE EmployeeID = {0}", id);
        DataView view = (DataView)ds.Select(DataSourceSelectArguments.Empty);
        if (view.Count > 0) {
            image = view[0][0] as byte[];
            note = view[0][1];
        }
    }
}