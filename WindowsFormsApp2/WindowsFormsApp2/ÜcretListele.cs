using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApp2
{
    public partial class ÜcretListele : Form
    {
        Çiftlik çiftlik5 = new Çiftlik();
        public ÜcretListele()
        {
            InitializeComponent();
        }

        private void ÜcretListele_Load(object sender, EventArgs e)
        {
            YenileListele();
        }
        private void YenileListele()
        {
            string cümle = "select *from Ücretlendirme";
            SqlDataAdapter adtr2 = new SqlDataAdapter();
            dataGridView1.DataSource = çiftlik5.listele(adtr2, cümle);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string cümle = "update Ücretlendirme set Gün=@Gün,Ücret=@Ücret where Gün=@Gün";
            SqlCommand komut6 = new SqlCommand();
            komut6.Parameters.AddWithValue("@Gün", textBox5.Text);
            komut6.Parameters.AddWithValue("@Ücret", textBox6.Text);
            çiftlik5.ekle_sil_güncelle(komut6, cümle);
            foreach (Control item in Controls) if (item is TextBox) item.Text = "";
            YenileListele();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void dataGridView1_CellMouseDoubleClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            DataGridViewRow satır = dataGridView1.CurrentRow;
            textBox5.Text = satır.Cells[0].Value.ToString();
            textBox6.Text = satır.Cells[1].Value.ToString();
        }
    }
}
