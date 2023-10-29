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

function createNotificationComponent(sender) {
  const newNotificationComponent = document.createElement("a");
  // TODO: append component (come prendere il chatID)
}

function appendAndIncrementNotificationComponent(notificationBoxID, /**@type {HTMLDivElement}*/ board) {
  const notificationBox = document.getElementById(notificationBoxID);
  !notificationBox && board.appendChild(createNotificationComponent(notificationBoxID));
}

nws.onmessage = (event) => {
  const { type, who, from } = JSON.parse(event.data);
  if (type === "online_notification") {
    const flagElement = document.getElementById(who)?.querySelector("div") ?? undefined;
    flagElement && !flagElement.classList.contains("connected") && flagElement.classList.add("connected");
    return;
  }
  if (type === "offline_notification") {
    const flagElement = document.getElementById(who)?.querySelector("div") ?? undefined;
    flagElement && flagElement.classList.contains("connected") && flagElement.classList.remove("connected");
    return;
  }
  if (type === "message_notification") {
    audio.currentTime = 0;
    audio.play();
    const notificationLabel = document.querySelector("div.notification > label");
    notificationLabel.innerHTML = parseInt(notificationLabel.innerHTML) + 1;
    runNotificationFetch(
      {
        user: currentUsername,
        sender: from,
        timestampMillis: Date.now(),
      },
      "notification"
    );
    const notificationBoard = document.getElementById("notification-board");
    notificationBoard && appendAndIncrementNotificationComponent(from, notificationBoard);
    return;
  }
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
