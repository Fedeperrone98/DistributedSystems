const ws = new WebSocket(`${webSocketUrl}/notify?username=${currentUsername}`);
const audio = new Audio("sounds/alert.wav");

ws.onmessage = (event) => {
  audio.play();
  const sender = event.data;
  const notificationLabel = document.querySelector("div.notification > label");
  notificationLabel.innerHTML = parseInt(notificationLabel.innerHTML) + 1;
  // TODO: add also real-time modification for notification page
};
