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
    public partial class MüşteriEkle : Form
    {
        Çiftlik çiftlik = new Çiftlik();
        public MüşteriEkle()
        {
            InitializeComponent();
        }

        private void MüşteriEkle_Load(object sender, EventArgs e)
        {
           
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string cümle = "insert into Müşteriler(MüşteriId,Ad,Soyad,Telefon,DoğumTarihi,PaketId) values(@MüşteriId,@Ad,@Soyad,@Telefon,@DoğumTarihi,@PaketId)";
            SqlCommand komut2 = new SqlCommand();
            komut2.Parameters.AddWithValue("@MüşteriId", textBox1.Text);
            komut2.Parameters.AddWithValue("@Ad", textBox2.Text);
            komut2.Parameters.AddWithValue("@Soyad", textBox3.Text);
            komut2.Parameters.AddWithValue("@Telefon", textBox4.Text);
            komut2.Parameters.AddWithValue("@DoğumTarihi", textBox5.Text);
            komut2.Parameters.AddWithValue("@PaketId", textBox6.Text);
            çiftlik.ekle_sil_güncelle(komut2, cümle);
            foreach (Control item in Controls) if (item is TextBox) item.Text = "";

            //string evet = "evet";
            //string cümle1 = "update Üyelik set PaketId=@PaketId,EğitmenId=EğitmenId,Gün=Gün,DersSaati=DersSaati,Manej=Manej,Satıldı='evet' where PaketId=@PaketId";
            //SqlCommand komut2_1 = new SqlCommand();
            //komut2_1.Parameters.AddWithValue("@PaketId", textBox6.Text);
            //komut2_1.Parameters.AddWithValue("Satıldı",evet);
            //çiftlik.ekle_sil_güncelle(komut2_1, cümle1);
            
        }
    }
}
