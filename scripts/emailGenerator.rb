#This is an automatic daily report email generator I made to save time
#Let me know if you have any problems
#d.hovanky@axelmark.co.jp

username = "デビッド"

taskNext = ""
topics = ""
discussions = ""
tasksCurrent = ""


meetingMorning = ""
taskMorning = "リファクタリングのつづき"
lunchbreak = "昼食"
taskAfternoon = ""
taskEvening = "Gitファイル管理、マージコンフリクトを直したり、デバッグなど"
taskLateEvening = ""
meetingEvening = "エンジニアの夕会"


todaySchedule = Hash.new
todaySchedule = {
		"10:00 - 10:30" => meetingMorning,
		"10:30 - 13:00" => taskMorning,
		"13:00 - 14:00" => lunchbreak,
		"14:00 - 18:00" => taskAfternoon,
		"18:00 - 18:30" => meetingEvening,
		"18:30 - 19:00" => taskEvening,
		"19:00 - 19:30" => taskLateEvening,
		}

t = Time.now
out_file = File.new("DailyReport_" + t.year.to_s + "%.2i" %t.month.to_s + "%.2i" %t.day.to_s + ".txt", "w")

out_file.puts("\n\nおつかれさまです！" + username + "です。今日の日報をご確認お願い致します！\n\n")

out_file.puts(" (１)今日の実績\n\n")

todaySchedule.each {|key, value| out_file.puts("#{key} #{value}")}
out_file.puts("\n\n")

out_file.puts("（２）明日の予定\n")
out_file.puts("・" + taskNext)

out_file.puts("\n\n")
out_file.puts("（3）今日のトピックス\n")
out_file.puts(topics)

out_file.puts("\n\n")
out_file.puts("（4）相談事項\n")
out_file.puts(discussions)

out_file.puts("\n\n")
out_file.puts("（5） 現在の課題（優先事項）\n")
out_file.puts("・現在の課題は" + tasksCurrent + "です。")

out_file.puts("\n\nよろしくお願い致します。\n")
out_file.puts("\n\--\ndavid\n--")


out_file.close