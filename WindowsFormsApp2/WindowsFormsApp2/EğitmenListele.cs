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
    public partial class EğitmenListele : Form
    {
        Çiftlik çiftlik3 = new Çiftlik();
        public EğitmenListele()
        {
            InitializeComponent();
        }

        private void EğitmenListele_Load(object sender, EventArgs e)
        {
            YenileListele();
        }
        private void YenileListele()
        {
            string cümle = "select *from Eğitmenler";
            SqlDataAdapter adtr2 = new SqlDataAdapter();
            dataGridView1.DataSource = çiftlik3.listele(adtr2, cümle);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string cümle = "update Eğitmenler set EğitmenId=@EğitmenId,Ad=@Ad,Soyad=@Soyad,Telefon=@Telefon,AtId=@AtId where EğitmenId=@EğitmenId";
            SqlCommand komut4 = new SqlCommand();
            komut4.Parameters.AddWithValue("@EğitmenId", textBox1.Text);
            komut4.Parameters.AddWithValue("@Ad", textBox2.Text);
            komut4.Parameters.AddWithValue("@Soyad", textBox3.Text);
            komut4.Parameters.AddWithValue("@Telefon", textBox4.Text);
            komut4.Parameters.AddWithValue("@AtId", textBox5.Text);
            çiftlik3.ekle_sil_güncelle(komut4, cümle);
            foreach (Control item in Controls) if (item is TextBox) item.Text = "";
            YenileListele();
        }

        private void textBox7_TextChanged(object sender, EventArgs e)
        {
            string cümle = "select *from Eğitmenler where EğitmenId like '%" + textBox7.Text + "%'";
            SqlDataAdapter adtr2 = new SqlDataAdapter();
            dataGridView1.DataSource = çiftlik3.listele(adtr2, cümle);
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
        }

        
    }
}
