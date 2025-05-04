import React from "react";
import { createRoot } from "react-dom/client";

function App() {
  // State to hold the user's message
  const [message, setMessage] = React.useState("");

  // State to hold the AI's response
  const [response, setResponse] = React.useState("");

  // Function to send the user's message to the backend API
  const sendMessage = async () => {
    const res = await fetch("/api/chat", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ prompt: message }) // Send the user's message as a JSON payload
    });
    const data = await res.json(); // Parse the JSON response
    setResponse(data.reply); // Update the response state with the AI's reply
  };

  return (
    <div>
      <h1>Chat with AI</h1>
      {/* Input field for the user's message */}
      <input value={message} onChange={e => setMessage(e.target.value)} />
      {/* Button to send the message */}
      <button onClick={sendMessage}>Send</button>
      {/* Display the AI's response */}
      <p><strong>Response:</strong> {response}</p>
    </div>
  );
}

// Render the React app into the root div
const root = createRoot(document.getElementById("root"));
root.render(<App />);
