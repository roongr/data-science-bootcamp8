## HW01: Chatbot 5 dialogues

customer_bot <- function(){
  user_name = readline("What's your name?: ")
  user_age = readline("How old are you?: ")
  user_status = readline("What is your status?: ")
  user_hobby = readline("What's your hobby?: ")
  user_color = readline("What's your favorite color?: ")
  
  print(paste("Hi!", user_name))
  print(paste("You are", user_age, "years old"))
  print(paste("You are", user_status))
  print(paste("Your hobby is", user_hobby))
  print(paste("Your favorite color is", user_color))
}
