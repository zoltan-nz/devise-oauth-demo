class ActiveSupport::Logger::SimpleFormatter
  SEVERITY_TO_COLOR_MAP  = {'DEBUG'=>'0;37', 'INFO'=>'32', 'WARN'=>'33', 'ERROR'=>'31', 'FATAL'=>'31', 'UNKNOWN'=>'37'}
  STRINGIFIED_RAILS_ROOT = Rails.root.to_s

  def call(severity, time, progname, msg)
    formatted_severity = sprintf("%-5s",severity)
    formatted_time = time.strftime("%Y-%m-%d %H:%M:%S.") << time.usec.to_s[0..2].rjust(3)
    color = SEVERITY_TO_COLOR_MAP[severity]

    call_line=""
    if Rails.logger.debug? || Rails.env.development?

      call_line = caller.detect{|line| line !~ /(activerecord|active_support|__DELEGATION__|\/lib\/|\/vendor\/plugins|\/vendor\/gems|\/app\/middleware|\/gems\/)/i}
      call_line ||= ""
      match_data = call_line.match(/([^:]*:\d+)/)
      call_line = match_data[1]    if match_data
      call_line ||= ""
      call_line.gsub! STRINGIFIED_RAILS_ROOT, ''
    end

    msg =~ /Started/ ? divider = "\n ======================================================================================= \n \n" : divider = ''

    "#{divider}\033[#{color}m#{formatted_severity}\033[0;37m#{formatted_time}\033[0m #{call_line}  #{msg.strip} (pid:#{$$})\n"
  end
end