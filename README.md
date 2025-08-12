# FinalStudyGPT - Telegram Bot

A Telegram bot that provides educational resources including NCERT books, previous year questions, study batches, premium courses, and notes for classes 9-12.

## Features

- 📘 NCERT Books for classes 9-12
- 📚 Previous Year Questions (PYQ)
- 🎓 Study Batches
- 💎 Premium Courses
- 📝 Study Notes

## Local Development

1. Clone the repository:
```bash
git clone https://github.com/Stranger-bot1/finalstudygpt.git
cd finalstudygpt
```

2. Install dependencies:
```bash
pip install -r requirements.txt
```

3. Set up your environment variables:
   - Copy `.env.example` to `.env`
   - Add your Telegram bot token to the `.env` file

4. Run the bot:
```bash
python main.py
```

## Deployment

### Option 1: Heroku
1. Create a Heroku account and install Heroku CLI
2. Login to Heroku: `heroku login`
3. Create a new app: `heroku create your-app-name`
4. Set environment variable: `heroku config:set TELEGRAM_BOT_TOKEN=your_bot_token`
5. Deploy: `git push heroku main`

### Option 2: Railway
1. Connect your GitHub repository to Railway
2. Set the environment variable `TELEGRAM_BOT_TOKEN`
3. Deploy automatically from GitHub

### Option 3: PythonAnywhere
1. Upload your code to PythonAnywhere
2. Set up environment variables in the web console
3. Create a task to run your bot continuously

## Environment Variables

- `TELEGRAM_BOT_TOKEN`: Your Telegram bot token from @BotFather

## Bot Commands

- `/start` - Start the bot and show main menu
- `/cancel` - Cancel current operation