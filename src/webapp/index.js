import React from "react";
import { createRoot } from "react-dom/client";

function App() {
  const [message, setMessage] = React.useState("");
  const [response, setResponse] = React.useState("");

  const sendMessage = async () => {
    const res = await fetch("/api/chat", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ prompt: message })
    });
    const data = await res.json();
    setResponse(data.reply);
  };

  return (
    <div>
      <h1>Chat with AI</h1>
      <input value={message} onChange={e => setMessage(e.target.value)} />
      <button onClick={sendMessage}>Send</button>
      <p><strong>Response:</strong> {response}</p>
    </div>
  );
}

const root = createRoot(document.getElementById("root"));
root.render(<App />);
