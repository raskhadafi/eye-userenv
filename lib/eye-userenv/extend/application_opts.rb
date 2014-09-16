Eye::Dsl::ApplicationOpts
class Eye::Dsl::ApplicationOpts

  create_options_methods([:user_env_from], Hash)

end

Eye::Dsl::PureOpts
class Eye::Dsl::PureOpts

  def set_user_env_from(opts={})
    raise Eye::Dsl::Error, "Missing uid and/or env_file option" unless opts.has_key?(:uid) || opts.has_key?(:env_file)

    infos     = Etc.getpwnam opts[:uid]
    file_path = File.join(infos.dir, opts[:env_file])

    envs = IO.read(file_path).lines.inject({}) do |out, line|
      if result = /(?<key>\p{Word}*)=(?<value>.*)/.match(line)
        out[result['key']] = result['value']
      end

      out
    end

    env envs
  end

end
