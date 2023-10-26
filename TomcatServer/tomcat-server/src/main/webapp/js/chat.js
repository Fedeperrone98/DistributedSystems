const ws = new WebSocket(`${webSocketUrl}/chat?username=${currentUsername}`);

const messageList = [...document.querySelectorAll(".messages-board > .message-card").values()];
const chatID = new URL(location.href).searchParams.get("chatID");
const messagesBoard = document.querySelector(".messages-board");

function format(/** @type {Date}*/ date) {
  const year = date.getFullYear();
  const month = String(date.getMonth() + 1).padStart(2, "0");
  const day = String(date.getDate()).padStart(2, "0");
  const hours = String(date.getHours()).padStart(2, "0");
  const minutes = String(date.getMinutes()).padStart(2, "0");
  const seconds = String(date.getSeconds()).padStart(2, "0");
  return `${year}:${month}:${day} ${hours}:${minutes}:${seconds}.0`;
}

function runFetch(data) {
  fetch(`${fetchUrl}/message`, {
    method: "POST",
    body: JSON.stringify(data),
    headers: {
      "Content-Type": "application/json",
    },
  });
}

function appendMessageComponent(message, instant, type) {
  const newMessageComponent = document.createElement("div");
  newMessageComponent.classList.add("message-card");
  newMessageComponent.classList.add(type);
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
    const other_username = document.getElementById("other_user").innerText;
    const message = event.target.value;
    const instant = Date.now();
    event.target.value = "";
    runFetch({ chatID, message, timestampMillis: instant });
    appendMessageComponent(message, instant, "sender");
    ws.send(
      JSON.stringify({
        username: other_username,
        message,
      })
    );
  }
}

messagesBoard.scrollTo({ behavior: "instant", top: messagesBoard.scrollHeight });

ws.onmessage = (event) => {
  const message = JSON.parse(event.data);
  appendMessageComponent(message, Date.now(), "receiver");
};
ws.onerror = (event) => {
  console.error(event);
};
