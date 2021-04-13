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
    public partial class PaketListele : Form
    {
        Çiftlik çiftlik4 = new Çiftlik();
        public PaketListele()
        {
            InitializeComponent();
        }

        private void PaketListele_Load(object sender, EventArgs e)
        {
            YenileListele();
        }
        private void YenileListele()
        {
            string cümle = "select *from Üyelik";
            SqlDataAdapter adtr2 = new SqlDataAdapter();
            dataGridView1.DataSource = çiftlik4.listele(adtr2, cümle);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string cümle = "update Üyelik set PaketId=@PaketId,EğitmenId=@EğitmenId,Gün=@Gün,DersSaati=@DersSaati,Manej=@Manej,Satıldı=@Satıldı where PaketId=@PaketId";
            SqlCommand komut5 = new SqlCommand();
            komut5.Parameters.AddWithValue("@PaketId", textBox1.Text);
            komut5.Parameters.AddWithValue("@EğitmenId", textBox2.Text);
            komut5.Parameters.AddWithValue("@Gün", textBox3.Text);
            komut5.Parameters.AddWithValue("@DersSaati", textBox4.Text);
            komut5.Parameters.AddWithValue("@Manej", textBox5.Text);
            komut5.Parameters.AddWithValue("@Satıldı", textBox6.Text);
            çiftlik4.ekle_sil_güncelle(komut5, cümle);
            foreach (Control item in Controls) if (item is TextBox) item.Text = "";
            YenileListele();
        }

        private void textBox7_TextChanged(object sender, EventArgs e)
        {
            string cümle = "select *from Üyelik where PaketId like '%" + textBox7.Text + "%'";
            SqlDataAdapter adtr2 = new SqlDataAdapter();
            dataGridView1.DataSource = çiftlik4.listele(adtr2, cümle);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void dataGridView1_CellMouseDoubleClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            DataGridViewRow satır = dataGridView1.CurrentRow;
            textBox1.Text = satır.Cells[0].Value.ToString();
            textBox2.Text = satır.Cells[1].Value.ToString();
            textBox3.Text = satır.Cells[2].Value.ToString();
            textBox4.Text = satır.Cells[3].Value.ToString();
            textBox5.Text = satır.Cells[4].Value.ToString();
            textBox6.Text = satır.Cells[5].Value.ToString();
        }
    }
}
