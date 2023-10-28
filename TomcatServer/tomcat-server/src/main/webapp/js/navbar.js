const ws = new WebSocket(`${webSocketUrl}/notify?username=${currentUsername}`);

ws.onmessage = (event) => {
  const sender = event.data;
};
