using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using DevExpress.XtraEditors;
using SNIPER14;
using System.Threading;
using DevExpress.XtraSplashScreen;
using DevExpress.XtraWaitForm;
using DevExpress.Entity.Model;
using System.IO;

namespace _123Pay_Payment_Provider
{

    public partial class frmTransaction : DevExpress.XtraEditors.XtraForm
    {
        public frmTransaction()
        {
            InitializeComponent();
        }

        private void layoutControl1_Click(object sender, EventArgs e)
        {

        }
        private Dictionary<string, string> dictio;
        private void frmTransaction_Load(object sender, EventArgs e)
        {


           xtraTabControl1.ShowTabHeader = DevExpress.Utils.DefaultBoolean.False;
            gridControl1.UseEmbeddedNavigator = true;
            gridControl1.EmbeddedNavigator.ButtonClick += EmbeddedNavigator_ButtonClick;
            var button = gridControl1.EmbeddedNavigator.Buttons.CustomButtons.Add();
            button.Tag = "refresh";
        }



        private void EmbeddedNavigator_ButtonClick(object sender, NavigatorButtonClickEventArgs e)
        {
            if (e.Button.Tag != null && e.Button.Tag.ToString() == "refresh")
            {
                // load records  
            }
        }
        public void CloseWaitForm()
        {
            try
            {
                SplashScreenManager.CloseForm();
            }
            catch (Exception ex)
            {
                SplashScreenManager.CloseForm();
            }
        }
        private void simpleButton2_Click(object sender, EventArgs e)
        {
            Generate();
        }

        private DataTable GETdetailsinfo()
        {



            SNIPER14.JSONBAI.sqlmanager obj = new SNIPER14.JSONBAI.sqlmanager();
            DataTable _dt1 = new DataTable();
            _dt1 = obj.GetDataQuery(" select * from Getpending", Properties.Settings.Default.dbcon);
            return _dt1;

        }


        private void Generate()
        {
        
        
         ShowWaitForm(this);
            gridControl1.DataSource = this.GETdetailsinfo();
            var withBlock = gridView1;
            withBlock.Columns["TransactionCode"].Visible = false;
            withBlock.Columns["Documentinfo"].Visible = false;
            // withBlock.Columns(0).Visible = false;
            withBlock.BestFitColumns();
            withBlock.OptionsView.ColumnAutoWidth = true;
            withBlock.OptionsView.ShowAutoFilterRow = true;
            withBlock.OptionsBehavior.Editable = false;
            withBlock.OptionsFind.AllowFindPanel = true;
            withBlock.ScrollStyle = DevExpress.XtraGrid.Views.Grid.ScrollStyleFlags.LiveHorzScroll;
            withBlock.HorzScrollVisibility = DevExpress.XtraGrid.Views.Base.ScrollVisibility.Always;
            withBlock.OptionsView.ShowGroupPanel = false;
            CloseWaitForm();
        
        }


        public void ShowWaitForm(Form Form)
        {
            try
            {
                SplashScreenManager.ShowForm(Form, typeof(DemoWaitForm), true, true, false);
                Thread.Sleep(25);
            }
            catch (Exception ex)
            {
                CloseWaitForm();
            }
        }

        private void simpleButton1_Click(object sender, EventArgs e)
        {


            GetselectedInfo();
           

        }


        private void savebatchheader(DateTime PDATE, string material, int BATCH, string UOM, string Remarks
)
        {
            //    int ID;
            //    sqlmanager obj = new sqlmanager();
            //    dictio = new Dictionary<string, string>();
            //    dictio.Add("@pdate", PDATE);
            //    dictio.Add("@moutput", material);
            //    dictio.Add("@batch", BATCH);
            //    dictio.Add("@uom", UOM);
            //    dictio.Add("@createdby", _userid);
            //    dictio.Add("@Plant", _company);
            //    dictio.Add("@Pgroup", _Product_group);
            //    dictio.Add("@Remarks", Remarks);
            //    if (isevent == false)
            //    {
            //        ID = obj.InsertSproc("Insert_batching_headerV2", dictio, con);
            //        if (ID != 0)
            //            SavedetailsAction(System.Convert.ToInt32(ID));
            //    }
            //    else
            //    {
            //        updateheader(txtid.EditValue, txtremarks.EditValue);
            //        SavedetailsAction(System.Convert.ToInt32(txtid.EditValue));
            //    }
            //}


        }

        private void gridView1_DoubleClick(object sender, EventArgs e)
        {
            GetselectedInfo();
        }


        private void GetselectedInfo()
        {
            foreach (int i in gridView1.GetSelectedRows())
            {
                DataRow row = gridView1.GetDataRow(i);
                this.txtTransactioncode.EditValue = row[0].ToString();
                this.txtclient.EditValue = row[2].ToString();
                this.txtcustomer.EditValue = row[3].ToString();
                this.txtMerchant.EditValue = row[4].ToString();
                this.txtAccountNo.EditValue = row[5].ToString();
                this.txtAccountName.EditValue = row[6].ToString();
                this.txtOthersdetails.EditValue = row[7].ToString();
                this.cbxstatus.EditValue = row[8].ToString();
                this.txtAmount.EditValue = row[9].ToString();

                this.txtProccessedBy.EditValue = row[10].ToString();
                this.txtServiceFee.EditValue = row[12].ToString();
                this.txtRemarks.EditValue = row[13].ToString();
                xtraTabControl1.SelectedTabPage = xtraTabPage2;
            }
        }
        private void gridControl1_Click(object sender, EventArgs e)
        {

        }

        private void btnsave_Click(object sender, EventArgs e)
        {
            ShowWaitForm(this);
            SNIPER14.JSONBAI.sqlmanager obj = new SNIPER14.JSONBAI.sqlmanager();

            int ID;
            string fileName;
            string destFile;
            

          //  Properties.Settings.Default.ReceiptInfoPath.ToString();

            if (System.IO.Directory.Exists( Properties.Settings.Default.ReceiptInfoPath.ToString()) == false)
            { 
                System.IO.Directory.CreateDirectory(Properties.Settings.Default.ReceiptInfoPath.ToString());
           
            }
                

         
            fileName = Path.GetFileName(txtfileLocation.EditValue.ToString());
                    destFile = Path.Combine(Properties.Settings.Default.ReceiptInfoPath.ToString(), fileName);
                    File.Copy(txtfileLocation.EditValue.ToString(), destFile, true);
                    File.SetAttributes(destFile, FileAttributes.Normal);
                

            dictio = new Dictionary<string, string>();
            dictio.Add("@Action", "Update");
            dictio.Add("@Status", this.cbxstatus.EditValue.ToString());
            dictio.Add("@TransactionCode", this.txtTransactioncode.EditValue.ToString());
            dictio.Add("@Updatedby", this.LBLUSERVAL.Text);
            dictio.Add("@ServiceFee", this.txtServiceFee.EditValue.ToString());
            dictio.Add("@Remarks", this.txtRemarks.EditValue.ToString());
            dictio.Add("@Documentinfo", destFile.ToString());
           // DataTable _dt1 = new DataTable();
            ID = obj.InsertSproc("PaymentModule", dictio, Properties.Settings.Default.dbcon);
            CloseWaitForm();
            Generate();
            xtraTabControl1.SelectedTabPage = xtraTabPage1;
           
        }

        private void cbxstatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbxstatus.Text == "Done")
            {
                btnbrowse.Enabled = true;
            }

            
        }

        private void btnbrowse_Click(object sender, EventArgs e)
        {
            OpenFileDialog openFileDialog1 = new OpenFileDialog
            {
                InitialDirectory = @"D:\",
                Title = "Browse Text Files",

                CheckFileExists = true,
                CheckPathExists = true,

              //  DefaultExt = "txt",
               // Filter = "txt files (*.txt)|*.txt",
                FilterIndex = 2,
                RestoreDirectory = true,

                ReadOnlyChecked = true,
                ShowReadOnly = true
            };

            if (openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                txtfileLocation.EditValue = openFileDialog1.FileName;
            }  
        }

        private void txtServiceFee_EditValueChanged(object sender, EventArgs e)
        {

        }

        private void txtServiceFee_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar) &&
        (e.KeyChar != '.'))
            {
                e.Handled = true;
            }

            // only allow one decimal point
            if ((e.KeyChar == '.') && ((sender as TextBox).Text.IndexOf('.') > -1))
            {
                e.Handled = true;
            }
        }

        private void BTNEXPORT_Click(object sender, EventArgs e)
        {
            Export();
        }

        public void Export()
        {
            string filename;
            // Ask the user where to save the file to
            SaveFileDialog SaveFileDialog = new SaveFileDialog();
            SaveFileDialog.Filter = "xls files (*.xls)|*.xls";
            SaveFileDialog.FilterIndex = 2;
            SaveFileDialog.RestoreDirectory = true;
            if (SaveFileDialog.ShowDialog() == DialogResult.OK)
            {

                // This is required so that excel doesn't make all the grids very small. This will export all grids space out evenly
                gridView1.OptionsPrint.AutoWidth = false;

                // Set the selected file as the filename
                filename = SaveFileDialog.FileName;

                // Export the file via inbuild function
                {
                    var withBlock = gridView1;
                    withBlock.ExportToXls(filename);
                }

                // If the file exists (i.e. export worked), then open it
                if (System.IO.File.Exists(filename))
                {
                     DialogResult = XtraMessageBox.Show("File has been exported to " + filename  + "Did you want to open the file now?", "123PAY", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (DialogResult == DialogResult.Yes)
                        System.Diagnostics.Process.Start(filename);
                }
            }
        }

    }
}