package com.oskarwicha.images.FaceRecognition
{

	/**
	 * @flowerModelElementId _TmCksGglEeCqZchJBDddKw
	 */
	internal final class EuclideanDistance implements IDistanceMeasure
	{
		public function EuclideanDistance()
		{
		}

		/**
		 * Oblicza dystans miądzy dwoma wektorami przechowywanymi
		 * w obiektach klasy <code>FeatureVector</code>.
		 * Funkcja niezbedna w celu implementacji interfejsu
		 * <code>DistanceMeasure</code>.
		 *
		 * @param fv1 Pierwszy z wektorów
		 * @param fv2 Drugi z wektorów
		 * @return Dystans miedzy wektorem <code>fv1</code> a <code>fv2</code>
		 *
		 */
		public function DistanceBetween(fv1:FeatureVector, fv2:FeatureVector):Number
		{
			var fv1Vector:Vector.<Number> = fv1.getFeatureVector();
			var fv2Vector:Vector.<Number> = fv2.getFeatureVector();
			var fv1VectorLength:int = fv1Vector.length;
			var fv2VectorLength:int = fv2Vector.length;

			var num:uint = fv1VectorLength ^ ((fv1VectorLength ^ fv2VectorLength) & ~(int(fv1VectorLength < fv2VectorLength) + 1)); //assigns bigger one

			var fv1fv2diff:Number;
			var dist:Number = 0.0;
			for (var i:uint = 0; i < num; ++i)
			{
				fv1fv2diff = fv1Vector[i] - fv2Vector[i];
				dist += (fv1fv2diff * fv1fv2diff);
			}
			//trace("Odległość miedzy wektorami = " + Math.sqrt(dist));

			//the neighbor with the smallest distance also has the 
			//smallest squared distance, so we can save some computation
			//time by returning squared values
			return dist;
		}
	}
}