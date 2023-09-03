const notesList = document.getElementById('notes-list');
const titleInput = document.getElementById('title-input');
const contentInput = document.getElementById('content-input');
const addButton = document.getElementById('add-button');

addButton.addEventListener('click', () => {
  const title = titleInput.value;
  const content = contentInput.value;

  if (title) {
    fetch('/notes', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ title, content }),
    })
      .then(response => response.json())
      .then(data => {
        const listItem = document.createElement('li');
        listItem.innerHTML = `<strong>${data.title}</strong>: ${data.content}`;
        notesList.appendChild(listItem);
        titleInput.value = '';
        contentInput.value = '';
      })
      .catch(error => console.error('Error:', error));
  }
});

fetch('/notes')
  .then(response => response.json())
  .then(data => {
    data.forEach(note => {
      const listItem = document.createElement('li');
      listItem.innerHTML = `<strong>${note.title}</strong>: ${note.content}`;
      notesList.appendChild(listItem);
    });
  })
  .catch(error => console.error('Error:', error));

