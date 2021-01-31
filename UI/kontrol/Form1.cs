using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace kontrol
{
    public partial class Form1 : Form
    {

        byte sayi=0;

        protected override void  OnHandleCreated(EventArgs e)
{
 	 base.OnHandleCreated(e);
            usb.RegisterHandle(Handle);
}

        protected override void  WndProc(ref Message m)
{
 	usb.ParseMessages(ref m);
            base.WndProc(ref m);
}
        private void usb_gonder(byte veri)
        {
        byte[] dizi = new byte[usb.SpecifiedDevice.OutputReportLength+1];
        dizi[0]=0;
            dizi[1]=veri;
            MessageBox.Show(" "+Convert.ToString(veri));
            for( int i =2; i< hex.Text.Length;i++){dizi[i]=0xFF;}

            if (usb.SpecifiedDevice != null)
                usb.SpecifiedDevice.SendData(dizi);
            else
                MessageBox.Show("Servo yok");
        }


        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            alt.Text = "USB Cihaz takılı değil";
        }

        private void usb_OnSpecifiedDeviceArrived(object sender, EventArgs e)
        {
            alt.Text = "Servo bağlandı";
        }

        private void usb_OnSpecifiedDeviceRemoved(object sender, EventArgs e)
        {
            alt.Text = "Servo çıkarıldı";
            buton.Enabled = false;

        }

        private void usb_OnDeviceArrived(object sender, EventArgs e)
        {
            alt.Text = "USB Cihaz takılı";
        }

        private void usb_OnDeviceRemoved(object sender, EventArgs e)
        {
            alt.Text = "USB Cihaz takılı değil";
        }




        private void buton_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt16(hex.Text) <256)
            {
                sayi = Convert.ToByte(hex.Text);
                usb_gonder(sayi);
            }
            else
                MessageBox.Show("256 dan küçük sayı gir");
        }

        private void button1_Click(object sender, EventArgs e)
        {
            usb.VendorId = 4660;
            usb.ProductId = 4660;

            try
            {
                usb.CheckDevicePresent();
                alt.Text="Galiba bağlandı";
                buton.Enabled = true;
            }

        catch(Exception hata)
            {
                MessageBox.Show("Ürün kod hatası ! ; \n "+hata);
        }
        }
    }
}
