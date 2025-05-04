import azure.functions as func
import logging
import json
import openai
import os

# Initialize the Azure Function App
app = func.FunctionApp(http_auth_level=func.AuthLevel.ANONYMOUS)

@app.function_name(name="chat")
@app.route(route="chat", auth_level=func.AuthLevel.ANONYMOUS, methods=["POST"])
def chat(req: func.HttpRequest) -> func.HttpResponse:
    # Log the receipt of a chat request
    logging.info("Chat request received.")
    try:
        # Parse the request body to extract the prompt
        req_body = req.get_json()
        prompt = req_body.get("prompt")

        # Set the OpenAI API key from environment variables
        openai.api_key = os.getenv("OPENAI_API_KEY")

        # Generate a response using OpenAI's ChatCompletion API
        response = openai.ChatCompletion.create(
            model="gpt-3.5-turbo",
            messages=[{"role": "user", "content": prompt}]
        )
        reply = response.choices[0].message["content"]

        # Return the AI-generated response as JSON
        return func.HttpResponse(json.dumps({"reply": reply}), mimetype="application/json")
    except Exception as e:
        # Log any errors and return a 500 response
        logging.error(f"Error: {str(e)}")
        return func.HttpResponse("Error processing request", status_code=500)
