TextField(
  controller: _inputController,
  decoration: const InputDecoration(
    labelText: "Write your English here (e.g. Describe your work today)",
  ),
  maxLines: 4,
),
ElevatedButton(
  onPressed: () async {
    setState(() => _loading = true);
    final result = await MetaAIService.correctWriting(_inputController.text);
    setState(() {
      _aiResult = result;
      _loading = false;
    });
  },
  child: const Text("Submit for AI correction"),
)
