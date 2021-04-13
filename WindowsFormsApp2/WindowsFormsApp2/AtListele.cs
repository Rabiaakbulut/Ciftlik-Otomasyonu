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
    public partial class AtListele : Form
    {
        Çiftlik çiftlik2 = new Çiftlik();
        public AtListele()
        {
            InitializeComponent();
        }

        private void AtListele_Load(object sender, EventArgs e)
        {
            YenileListele();
        }
        private void YenileListele()
        {
            string cümle = "select *from Atlar";
            SqlDataAdapter adtr2 = new SqlDataAdapter();
            dataGridView1.DataSource = çiftlik2.listele(adtr2, cümle);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string cümle = "update Atlar set AtId=@AtId,Ad=@Ad,Irk=@Irk,Cinsiyet=@Cinsiyet where AtId=@AtId";
            SqlCommand komut3 = new SqlCommand();
            komut3.Parameters.AddWithValue("@AtId", textBox1.Text);
            komut3.Parameters.AddWithValue("@Ad", textBox2.Text);
            komut3.Parameters.AddWithValue("@Irk", textBox3.Text);
            komut3.Parameters.AddWithValue("@Cinsiyet", textBox4.Text);
            çiftlik2.ekle_sil_güncelle(komut3, cümle);
            foreach (Control item in Controls) if (item is TextBox) item.Text = "";
            YenileListele();
        }

        private void textBox7_TextChanged(object sender, EventArgs e)
        {
            string cümle = "select *from Atlar where AtId like '%" + textBox7.Text + "%'";
            SqlDataAdapter adtr2 = new SqlDataAdapter();
            dataGridView1.DataSource = çiftlik2.listele(adtr2, cümle);
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
        }

        
    }
}
