abstract class FieldValidator {
  String? validate(String? value);
  String get errorMessage;
}

class EmailValidator extends FieldValidator {
  @override
  String get errorMessage => 'Please enter a valid email address';

  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value)) {
      return errorMessage;
    }

    return null;
  }
}

class NameValidator extends FieldValidator {
  @override
  String get errorMessage => 'Please enter a valid name';

  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }

    final nameRegex = RegExp(r"^[a-zA-Z\s\-']+$");

    if (!nameRegex.hasMatch(value)) {
      return errorMessage;
    }

    if (value.trim().length < 2) {
      return 'Name must be at least 2 characters';
    }

    return null;
  }
}

class PasswordValidator extends FieldValidator {
  final int minLength;

  PasswordValidator({this.minLength = 8});

  @override
  String get errorMessage => 'Password must be at least $minLength characters';

  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < minLength) {
      return errorMessage;
    }

    return null;
  }
}

class RequiredValidator extends FieldValidator {
  final String fieldName;

  RequiredValidator({this.fieldName = 'This field'});

  @override
  String get errorMessage => '$fieldName is required';

  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return errorMessage;
    }
    return null;
  }
}

class CompositeValidator extends FieldValidator {
  final List<FieldValidator> validators;

  CompositeValidator(this.validators);

  @override
  String get errorMessage => '';

  @override
  String? validate(String? value) {
    for (final validator in validators) {
      final result = validator.validate(value);
      if (result != null) {
        return result;
      }
    }
    return null;
  }
}
