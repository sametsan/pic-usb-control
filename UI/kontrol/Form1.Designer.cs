namespace kontrol
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.usb = new UsbLibrary.UsbHidPort(this.components);
            this.hex = new System.Windows.Forms.TextBox();
            this.buton = new System.Windows.Forms.Button();
            this.button1 = new System.Windows.Forms.Button();
            this.alt = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // usb
            // 
            this.usb.ProductId = 0;
            this.usb.VendorId = 0;
            // 
            // hex
            // 
            this.hex.Location = new System.Drawing.Point(7, 65);
            this.hex.Name = "hex";
            this.hex.Size = new System.Drawing.Size(209, 20);
            this.hex.TabIndex = 0;
            // 
            // buton
            // 
            this.buton.Enabled = false;
            this.buton.Location = new System.Drawing.Point(7, 91);
            this.buton.Name = "buton";
            this.buton.Size = new System.Drawing.Size(209, 32);
            this.buton.TabIndex = 1;
            this.buton.Text = "Gönder";
            this.buton.UseVisualStyleBackColor = true;
            this.buton.Click += new System.EventHandler(this.buton_Click);
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(7, 12);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(209, 47);
            this.button1.TabIndex = 3;
            this.button1.Text = "Bağlan";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // alt
            // 
            this.alt.AutoSize = true;
            this.alt.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.alt.Location = new System.Drawing.Point(12, 139);
            this.alt.Name = "alt";
            this.alt.Size = new System.Drawing.Size(0, 25);
            this.alt.TabIndex = 4;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(227, 261);
            this.Controls.Add(this.alt);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.buton);
            this.Controls.Add(this.hex);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private UsbLibrary.UsbHidPort usb;
        private System.Windows.Forms.TextBox hex;
        private System.Windows.Forms.Button buton;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Label alt;
    }
}

