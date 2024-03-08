import requests

def take_screenshot(url, output_file):
    api_key = "YOUR_API_KEY"  # 替换为你的网页截图API密钥
    endpoint = "https://screenshotapi.net/api/v1/screenshot"
    params = {
        "token": api_key,
        "url": url
    }

    response = requests.get(endpoint, params=params, stream=True)

    if response.status_code == 200:
        with open(output_file, "wb") as file:
            for chunk in response.iter_content(chunk_size=1024):
                file.write(chunk)

        return True

    return False

def main():
    url = input("Enter the URL to take a screenshot: ")
    output_file = input("Enter the output file name: ")

    success = take_screenshot(url, output_file)

    if success:
        print("Screenshot saved successfully.")
    else:
        print("Failed to take a screenshot.")

if __name__ == "__main__":
    main()
