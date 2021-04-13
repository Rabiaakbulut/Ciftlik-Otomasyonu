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
    
    public partial class MüşteriListele : Form
    {
        Çiftlik çiftlik1 = new Çiftlik();
        public MüşteriListele()
        {
            InitializeComponent();
        }

        private void MüşteriListele_Load(object sender, EventArgs e)
        {
            YenileListele();
        }
        private void YenileListele()
        {
            string cümle = "select *from Müşteriler";
            SqlDataAdapter adtr2 = new SqlDataAdapter();
            dataGridView1.DataSource = çiftlik1.listele(adtr2, cümle);
        }

        private void textBox7_TextChanged(object sender, EventArgs e)
        {
            string cümle = "select *from Müşteriler where MüşteriId like '%"+textBox7.Text+"%'";
            SqlDataAdapter adtr2 = new SqlDataAdapter();
            dataGridView1.DataSource = çiftlik1.listele(adtr2, cümle);
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

        private void button1_Click(object sender, EventArgs e)
        {
            string cümle = "update Müşteriler set MüşteriId=@MüşteriId,Ad=@Ad,Soyad=@Soyad,Telefon=@Telefon,DoğumTarihi=@DoğumTarihi,PaketId=@PaketId where MüşteriId=@MüşteriId";
            SqlCommand komut2 = new SqlCommand();
            komut2.Parameters.AddWithValue("@MüşteriId", textBox1.Text);
            komut2.Parameters.AddWithValue("@Ad", textBox2.Text);
            komut2.Parameters.AddWithValue("@Soyad", textBox3.Text);
            komut2.Parameters.AddWithValue("@Telefon", textBox4.Text);
            komut2.Parameters.AddWithValue("@DoğumTarihi", textBox5.Text);
            komut2.Parameters.AddWithValue("@PaketId", textBox6.Text);
            çiftlik1.ekle_sil_güncelle(komut2, cümle);
            foreach (Control item in Controls) if (item is TextBox) item.Text = "";
            YenileListele();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            DataGridViewRow satır = dataGridView1.CurrentRow;
            string cümle = "delete from Müşteriler where MüşteriId='" + satır.Cells["MüşteriId"].Value.ToString() + "'";
            SqlCommand komut2 = new SqlCommand();
            çiftlik1.ekle_sil_güncelle(komut2, cümle);
            YenileListele();
        }
    }
}
