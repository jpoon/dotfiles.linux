# .bash_profile

if [-f ~/.bashrc]; then
    . ~/.bashrc
fi
#. $HOME/.bashrc

# Environment Variables
export PATH=/usr/local/bin:/opt/google-appengine:$PATH
export PYTHONPATH=$PYTHONPATH:/opt/google-appengine:/opt/google-appengine/lib/yaml/lib:/opt/google-appengine/lib/antlr3:/opt/google-appengine/lib/webob
export SVN_EDITOR="vim"

export LC_ALL=
export LC_COLLATE="C"
