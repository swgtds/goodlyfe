class QuestionModal {
    final String question;
    final List< String> options;
    final int stressIndex;
    
    const QuestionModal({
        required this.stressIndex,
        required this.question,
        required this.options,
    });
    }
    
    const List< QuestionModal> questions = [
    QuestionModal(
    question: '1. Been able to concentrate on what you are doing?',
    stressIndex: 1,
    options: [
    '(a) Not at all',
    '(b) No more than usual',
    '(c) Rather more than usual',
    '(d) Much more than usual',
    ],
    ),
    QuestionModal(
        question: '2. Felt you are playing a useful part in thing?',
        stressIndex: 3,
        options: [
    '(a) Not at all',
    '(b) No more than usual',
    '(c) Rather more than usual',
    '(d) Much more than usual',
        ],
    ),
    QuestionModal(
        question: '3. Felt capable of making decisions about things?',
        stressIndex: 1,
        options: [
    '(a) Not at all',
    '(b) No more than usual',
    '(c) Rather more than usual',
    '(d) Much more than usual',
        ],
    ),
    QuestionModal(
        question: '4. Been able to enjoy your day-to-day activities?',
        stressIndex: 0,
        options: [
    '(a) Not at all',
    '(b) No more than usual',
    '(c) Rather more than usual',
    '(d) Much more than usual',
        ],
    ),
    QuestionModal(
        question: '5. Been able to face up your problems?',
        stressIndex: 2,
        options: [
    '(a) Not at all',
    '(b) No more than usual',
    '(c) Rather more than usual',
    '(d) Much more than usual',
        ],
    ),
    QuestionModal(
        question: '6. Been feeling reasonably happy, all things considered?',
        stressIndex: 3,
        options: [
    '(a) Not at all',
    '(b) No more than usual',
    '(c) Rather more than usual',
    '(d) Much more than usual',
        ],
    ),
    QuestionModal(
        question: '7. Lost much sleep over worry?',
        stressIndex: 0,
        options: [
    '(a) Not at all',
    '(b) No more than usual',
    '(c) Rather more than usual',
    '(d) Much more than usual',
        ],
    ),
    QuestionModal(
        question: '8. Felt constantly under strain?',
        stressIndex: 1,
        options: [
    '(a) Not at all',
    '(b) No more than usual',
    '(c) Rather more than usual',
    '(d) Much more than usual',
        ],
    ),
    QuestionModal(
        question:
        '9. Felt you could not overcome your difficulties?',
        stressIndex: 3,
        options: [
    '(a) Not at all',
    '(b) No more than usual',
    '(c) Rather more than usual',
    '(d) Much more than usual',
        ],
    ),
    QuestionModal(
        question:
        '10. Been feeling unhappy or depressed?',
        stressIndex: 3,
        options: [
    '(a) Not at all',
    '(b) No more than usual',
    '(c) Rather more than usual',
    '(d) Much more than usual',
        ],
    ),
    QuestionModal(
        question:
        '11. Been Losing confidence in yourself?',
        stressIndex: 3,
        options: [
    '(a) Not at all',
    '(b) No more than usual',
    '(c) Rather more than usual',
    '(d) Much more than usual',
        ],
    ),
    QuestionModal(
        question:
        '12. Been thinking of yourself as a worthless person?',
        stressIndex: 3,
        options: [
    '(a) Not at all',
    '(b) No more than usual',
    '(c) Rather more than usual',
    '(d) Much more than usual',
        ],
    ),
    ];