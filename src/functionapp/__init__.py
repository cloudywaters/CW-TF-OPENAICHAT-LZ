import os
import logging
from flask import Flask, request, jsonify
import openai

# Initialize Flask app
app = Flask(__name__)

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# Fetch OpenAI API key from environment variables
OPENAI_API_KEY = os.getenv("OPENAI_API_KEY")
if not OPENAI_API_KEY:
    logger.error("OpenAI API key is not set in environment variables")
    raise RuntimeError("OpenAI API key is not configured")

# Set OpenAI API key
openai.api_key = OPENAI_API_KEY

@app.route('/api/chat', methods=['POST'])
def chat():
    """
    Chat endpoint to handle user prompts and return OpenAI responses.
    """
    try:
        # Parse request body
        data = request.get_json()
        if not data or 'prompt' not in data:
            logger.warning("Invalid request: Missing 'prompt' in request body")
            return jsonify({"error": "Missing 'prompt' in request body"}), 400

        prompt = data['prompt']
        logger.info(f"Received prompt: {prompt}")

        # Call OpenAI API
        response = openai.Completion.create(
            engine="text-davinci-003",
            prompt=prompt,
            max_tokens=150
        )
        logger.info(f"OpenAI response: {response}")

        # Return response to client
        return jsonify(response), 200

    except openai.error.OpenAIError as e:
        logger.error(f"OpenAI API error: {e}")
        return jsonify({"error": "Error communicating with OpenAI API"}), 500

    except Exception as e:
        logger.error(f"Unexpected error: {e}")
        return jsonify({"error": "Internal server error"}), 500

if __name__ == "__main__":
    # Run the Flask app
    app.run(host="0.0.0.0", port=5000)