const ws = new WebSocket("ws://localhost:8081/chat"); // cambiare in deploy
const messageList = [...document.querySelectorAll(".messages-board > .message-card").values()];
const chatID = new URL(location.href).searchParams.get("chatID");
const messagesBoard = document.querySelector(".messages-board");

function runFetch(data) {
  fetch("http://localhost:8080/app/message", {
    method: "POST",
    body: JSON.stringify(data),
    headers: {
      "Content-Type": "application/json",
    },
  });
}

function format(/** @type {Date}*/ date) {
  const year = date.getFullYear();
  const month = String(date.getMonth() + 1).padStart(2, "0");
  const day = String(date.getDate()).padStart(2, "0");
  const hours = String(date.getHours()).padStart(2, "0");
  const minutes = String(date.getMinutes()).padStart(2, "0");
  const seconds = String(date.getSeconds()).padStart(2, "0");
  return `${year}:${month}:${day} ${hours}:${minutes}:${seconds}.0`;
}

function appendMessageComponent(message, instant) {
  const newMessageComponent = document.createElement("div");
  newMessageComponent.classList.add("message-card");
  newMessageComponent.classList.add("sender");
  newMessageComponent.innerHTML = `
    <div class="message-box">
    <label>
      ${message}
    </label>
    <label>
      ${format(new Date(instant))}
    </label>
    </div>
  `;
  messagesBoard.appendChild(newMessageComponent);
  messagesBoard.scrollTo({ behavior: "smooth", top: messagesBoard.scrollHeight });
  messageList.push(newMessageComponent);
}

function handleSend(event) {
  if (event.key === "Enter") {
    const message = event.target.value;
    const instant = Date.now();
    event.target.value = "";
    runFetch({ chatID, message, timestampMillis: instant });
    appendMessageComponent(message, instant);
  }
}

messagesBoard.scrollTo({ behavior: "instant", top: messagesBoard.scrollHeight });
