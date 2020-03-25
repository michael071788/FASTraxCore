using System.Windows.Media;

namespace FASTraxCore
{
    public static class SolidColorBrushHelper
    {
        public static SolidColorBrush ConvertStrToSolidColorBrush(this SolidColorBrush solidColorBrush, string solidColorBrushName)
        {
            if (solidColorBrush == null){throw new System.ArgumentNullException(nameof(solidColorBrush));}

            return (SolidColorBrush)(new BrushConverter().ConvertFrom(solidColorBrushName));
        }
    }
}
