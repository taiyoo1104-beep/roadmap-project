require 'faraday'
require 'json'

class GeminiService
  # 👈 取得したリストにある最新の安定版モデル 'gemini-2.5-flash' を指定します
  API_URL = ENV['GEMINI_API_URL']

  def initialize
    @api_key = ENV['GEMINI_API_KEY']
  end

  def generate_roadmap(prompt_input)
    system_prompt = <<~TEXT
      あなたはプロの学習アドバイザーです。
      ユーザーの要望に合わせて、具体的で実行可能なロードマップをJSON形式で作成してください。
      必ず以下の構造のJSONのみを返してください。余計な説明文は一切不要です。
      {
        "title": "ロードマップのタイトル",
        "duration": 3,
        "tasks_attributes": [
          { "content": "具体的なタスク1", "is_completed": false },
          { "content": "具体的なタスク2", "is_completed": false }
        ]
      }
    TEXT

    payload = {
      contents: [{
        parts: [{ text: system_prompt + "\n要望: #{prompt_input}" }]
      }]
    }

    response = Faraday.post("#{API_URL}?key=#{@api_key}") do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = payload.to_json
    end

    if response.success?
      result = JSON.parse(response.body)
      raw_text = result.dig("candidates", 0, "content", "parts", 0, "text")
      
      return nil if raw_text.nil?

      # AIが ```json ... ``` で囲った場合の掃除
      json_text = raw_text.gsub(/```json|```/, "").strip
      JSON.parse(json_text)
    else
      Rails.logger.error "---------- Gemini API Error ----------"
      Rails.logger.error "Status: #{response.status}"
      Rails.logger.error "Body: #{response.body}"
      nil
    end
  rescue => e
    Rails.logger.error "Gemini Service Error: #{e.message}"
    nil
  end
end