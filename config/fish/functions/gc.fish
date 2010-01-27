function gc
  echo 'Commit Message:';
  read message;
	git commit -m $message;
end
