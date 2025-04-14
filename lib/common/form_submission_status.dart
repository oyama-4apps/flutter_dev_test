abstract class FormSubmissionStatus {
  const FormSubmissionStatus();
}

class IniticalStatus extends FormSubmissionStatus {
  const IniticalStatus();
}

class Submitting extends FormSubmissionStatus {
  const Submitting();
}

class Success extends FormSubmissionStatus {
  const Success();
}

class Failed extends FormSubmissionStatus {
  final Exception exception;

  Failed({required this.exception});
}
