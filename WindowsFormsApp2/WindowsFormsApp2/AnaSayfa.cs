using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApp2
{
    public partial class AnaSayfa : Form
    {
        public AnaSayfa()
        {
            InitializeComponent();
        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void button9_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            MüşteriEkle müşteriekle = new MüşteriEkle();
            müşteriekle.ShowDialog();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            MüşteriListele müşterilistele = new MüşteriListele();
            müşterilistele.ShowDialog();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            AtListele atlistele = new AtListele();
            atlistele.ShowDialog();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            EğitmenListele eğitmenlistele = new EğitmenListele();
            eğitmenlistele.ShowDialog();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            PaketListele paketlistele = new PaketListele();
            paketlistele.ShowDialog();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            ÜcretListele ücretlistele = new ÜcretListele();
            ücretlistele.ShowDialog();
        }
    }
}
