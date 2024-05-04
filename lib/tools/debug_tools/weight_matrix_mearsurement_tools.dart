// Calculate Functions

double calculateBMI({int? cms, required String heightUnit, int? feet, int? inches, required double weight, required String weightUnit}) {
  double heightInMeters;

  if (heightUnit.toLowerCase() == 'cms') {
    heightInMeters = cms! / 100.0;
  } else if (heightUnit.toLowerCase() == 'inches') {
    heightInMeters = (feet! * 12 + (inches ?? 0)) * 0.0254;
  } else {
    throw ArgumentError('Invalid height unit. Use "cm" or "feet".');
  }

  double weightInKgs = (weightUnit.toLowerCase() == 'pounds') ? weight / 2.20462 : weight;

  double bmi = weightInKgs / (heightInMeters * heightInMeters);
  double roundedBMI = double.parse(bmi.toStringAsFixed(1));

  return roundedBMI;
}

double scaleBMIScore(double bmi) {
  const double idealMinBMI = 18.5;
  const double idealMaxBMI = 24.9;

  double clampedBMI = bmi.clamp(idealMinBMI, idealMaxBMI);

  double scaledBMI = (clampedBMI - idealMinBMI) / (idealMaxBMI - idealMinBMI);

  return scaledBMI;
}


double calculateWeightDifferencePercentage({required double actualWeight, required double idealWeight}) {
  double difference = actualWeight - idealWeight;
  double percentage = (difference / idealWeight) ;

  // Ensure the percentage is positive (even if actual weight is less than ideal weight)
  return percentage.abs();
}

int calculateIdealWeight({int? cms, required String heightUnit, int? feet, int? inches, required String gender, required String unit}) {
  double idealBMI = 23.0;
  double heightInMeters;

  if (heightUnit.toLowerCase() == 'cms') {
    heightInMeters = cms! / 100.0;
  } else if (heightUnit.toLowerCase() == 'inches') {
    heightInMeters = (feet! * 12 + (inches ?? 0)) * 0.0254;
  } else {
    throw ArgumentError('Invalid height unit. Use "cm" or "feet".');
  }

  double idealWeight = idealBMI * heightInMeters * heightInMeters;

  if (unit.toLowerCase() == 'pounds') {
    idealWeight *= 2.20462;
  }

  int roundedIdealWeight = idealWeight.round();

  return roundedIdealWeight;
}



int calculateBMR({
  required String gender,
  required double weight,
  required int heightFeet,
  required int heightInches,
  required int heightCms,
  required int age,
  required String bodyComposition,
  required String weightUnit,
  required String heightUnit,
}) {
  // Constants for unit conversion
  const double poundsToKgs = 0.453592;
  const double inchesToCms = 2.54;

  double weightInKgs;
  double heightInCms;

  // Convert weight to kilograms based on the unit provided
  if (weightUnit.toLowerCase() == 'pounds') {
    weightInKgs = weight * poundsToKgs;
  } else {
    weightInKgs = weight;
  }

  // Convert height to centimeters based on the unit provided
  if (heightUnit.toLowerCase() == 'cms') {
    heightInCms = heightCms.toDouble();
  } else {
    heightInCms = (heightFeet * 12 + heightInches) * inchesToCms;
  }

  int bmr;

  if (gender.toLowerCase() == 'male') {
    // BMR formula for men
    if (bodyComposition.toLowerCase() == 'slim') {
      bmr = (88.362 + (13.397 * weightInKgs) + (4.799 * heightInCms) - (5.677 * age) - 3.0).round();
    } else if (bodyComposition.toLowerCase() == 'medium') {
      bmr = (88.362 + (13.397 * weightInKgs) + (4.799 * heightInCms) - (5.677 * age)).round();
    } else if (bodyComposition.toLowerCase() == 'fat') {
      bmr = (88.362 + (13.397 * weightInKgs) + (4.799 * heightInCms) - (5.677 * age) + 3.0).round();
    } else {
      throw ArgumentError('Invalid body composition. Use "slim", "medium", or "fat".');
    }
  } else if (gender.toLowerCase() == 'female') {
    // BMR formula for women
    if (bodyComposition.toLowerCase() == 'slim') {
      bmr = (447.593 + (9.247 * weightInKgs) + (3.098 * heightInCms) - (4.330 * age) - 3.0).round();
    } else if (bodyComposition.toLowerCase() == 'medium') {
      bmr = (447.593 + (9.247 * weightInKgs) + (3.098 * heightInCms) - (4.330 * age)).round();
    } else if (bodyComposition.toLowerCase() == 'fat') {
      bmr = (447.593 + (9.247 * weightInKgs) + (3.098 * heightInCms) - (4.330 * age) + 3.0).round();
    } else {
      throw ArgumentError('Invalid body composition. Use "slim", "medium", or "fat".');
    }
  } else {
    throw ArgumentError('Invalid gender.');
  }

  return bmr;
}


double calculateBodyFatPercentage({required double bmi, required int age, required String gender, required String bodyComposition}) {
  int g = (gender.toLowerCase() == "male") ? 1 : 0;
  double fat;

  // Adjust the constants based on body composition
  if (bodyComposition.toLowerCase() == "slim") {
    fat = 1.20 * bmi + 0.23 * age - 10.8 * g - 5.4 - 3.0;
  } else if (bodyComposition.toLowerCase() == "medium") {
    fat = 1.20 * bmi + 0.23 * age - 10.8 * g - 5.4;
  } else if (bodyComposition.toLowerCase() == "fat") {
    fat = 1.20 * bmi + 0.23 * age - 10.8 * g - 5.4 + 3.0;
  } else {
    throw ArgumentError('Invalid body composition. Use "slim", "medium", or "fat".');
  }

  return double.parse(fat.toStringAsFixed(1));
}

double calculateSkeletalMassPercentage({
  required String gender,
  required double weight,
  required int heightFeet,
  required int heightInches,
  required int heightCms,
  required int age,
  required String bodyComposition,
  required String weightUnit,
  required String heightUnit,
}) {
  // Constants for unit conversion
  const double poundsToKgs = 0.453592;
  const double inchesToCms = 2.54;

  double weightInKgs;
  double heightInCms;

  // Convert weight to kilograms based on the unit provided
  if (weightUnit.toLowerCase() == 'pounds') {
    weightInKgs = weight * poundsToKgs;
  } else {
    weightInKgs = weight;
  }

  // Convert height to centimeters based on the unit provided
  if (heightUnit.toLowerCase() == 'cms') {
    heightInCms = heightCms.toDouble();
  } else {
    heightInCms = (heightFeet * 12 + heightInches) * inchesToCms;
  }

  // Adjust the formula based on your specific requirements
  double skeletalMassPercentage = 0.2 * weightInKgs + 0.15 * heightInCms - 0.05 * age;

  // Incorporate gender for more accuracy
  if (gender.toLowerCase() == 'male') {
    skeletalMassPercentage += 1.0; // Adjust this value based on your specific requirements for males
  } else if (gender.toLowerCase() == 'female') {
    skeletalMassPercentage -= 1.0; // Adjust this value based on your specific requirements for females
  } else {
    throw ArgumentError('Invalid gender.');
  }

  // Incorporate body composition for more accuracy
  if (bodyComposition.toLowerCase() == 'slim') {
    skeletalMassPercentage += 1.0; // Adjust this value based on your specific requirements
  } else if (bodyComposition.toLowerCase() == 'medium') {
    skeletalMassPercentage += 0.5; // Adjust this value based on your specific requirements
  } else if (bodyComposition.toLowerCase() == 'fat') {
    skeletalMassPercentage -= 0.5; // Adjust this value based on your specific requirements
  } else {
    throw ArgumentError('Invalid body composition. Use "slim", "medium", or "fat".');
  }

  return double.parse(skeletalMassPercentage.toStringAsFixed(1));
}





int convertToCms(int feet, int inches) {
  double heightInCms = (feet * 30.48) + (inches * 2.54);
  int result = heightInCms.round();
  return result;
}


int convertToKgs(double pounds) {
  double weightInKgs = pounds * 0.453592;
  int roundedWeight = weightInKgs.round();
  return roundedWeight;
}