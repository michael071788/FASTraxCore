using System;
using System.Windows;

namespace FASTraxCore
{
    public static class PointHelper
    {
        public static Point ComputeCartesianCoordinate(this Point point, double angle, double radius)
        {
            // convert to radians
            double angleRadius = (Math.PI / 180.0) * (angle - 90);

            double x = radius * Math.Cos(angleRadius);
            double y = radius * Math.Sin(angleRadius);

            return new Point(x, y);
        }

    }
}
