const nws = new WebSocket(`ws://localhost:8081/notify?username=${currentUsername}`);
const audio = new Audio("sounds/alert.wav");

function runNotificationFetch(data, endpoint) {
  fetch(`http://localhost:8080/app/${endpoint}`, {
    method: "POST",
    body: JSON.stringify(data),
    headers: {
      "Content-Type": "application/json",
    },
  });
}

nws.onmessage = (event) => {
  audio.currentTime = 0;
  audio.play();
  const sender = event.data;
  const notificationLabel = document.querySelector("div.notification > label");
  notificationLabel.innerHTML = parseInt(notificationLabel.innerHTML) + 1;
  runNotificationFetch(
    {
      user: currentUsername,
      sender: sender,
      timestampMillis: Date.now(),
    },
    "notification"
  );
  // TODO: add also real-time modification for notification page
};

async function getNotificationNumber() {
  const response = await fetch(`http://localhost:8080/app/notificationcount`, {
    method: "GET",
    headers: {
      "Content-Type": "application/json",
    },
  });
  const data = await response.json();
  return data;
}

getNotificationNumber().then((data) => {
  const notificationLabel = document.querySelector("div.notification > label");
  notificationLabel.innerHTML = data.count;
});
