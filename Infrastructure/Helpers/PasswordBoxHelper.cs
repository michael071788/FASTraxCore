using System.Windows;
using System.Windows.Controls;

namespace FASTraxCore
{
    public class PasswordBoxHelpers
    {
        static readonly bool isInitialised = false;

        #region Public Properties
        public static readonly DependencyProperty WatermarkProperty = DependencyProperty.RegisterAttached("Watermark", typeof(string), typeof(PasswordBoxHelpers), new UIPropertyMetadata(null, WatermarkChanged));

        public static readonly DependencyProperty ShowWatermarkProperty = DependencyProperty.RegisterAttached("ShowWatermark", typeof(bool), typeof(PasswordBoxHelpers), new UIPropertyMetadata(false));
        #endregion


        public static string GetWatermark(DependencyObject obj)
        {
            return (string)obj.GetValue(WatermarkProperty);
        }

        public static void SetWatermark(DependencyObject obj, string value)
        {
            obj.SetValue(WatermarkProperty, value);
        }

        public static bool GetShowWatermark(DependencyObject obj)
        {
            return (bool)obj.GetValue(ShowWatermarkProperty);
        }

        public static void SetShowWatermark(DependencyObject obj, bool value)
        {
            obj.SetValue(ShowWatermarkProperty, value);
        }

        static void WatermarkChanged(DependencyObject obj, DependencyPropertyChangedEventArgs e)
        {
            var pwd = obj as PasswordBox;

            CheckShowWatermark(pwd);

            if (!isInitialised)
            {
                pwd.PasswordChanged += new RoutedEventHandler(pwd_PasswordChanged);
                pwd.Unloaded += new RoutedEventHandler(pwd_Unloaded);
                //isInitialised = true;
            }
        }

        private static void CheckShowWatermark(PasswordBox pwd)
        {
            pwd.SetValue(PasswordBoxHelpers.ShowWatermarkProperty, pwd.Password == string.Empty);
        }

        static void pwd_PasswordChanged(object sender, RoutedEventArgs e)
        {
            var pwd = sender as PasswordBox;
            CheckShowWatermark(pwd);
        }

        static void pwd_Unloaded(object sender, RoutedEventArgs e)
        {
            var pwd = sender as PasswordBox;
            pwd.PasswordChanged -= new RoutedEventHandler(pwd_PasswordChanged);
        }

    }

}
