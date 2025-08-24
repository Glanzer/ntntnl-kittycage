# /opt/intentional/etc/profile.d/intentional.sh

# ... (your existing PATH, assign, cd, and completion functions are here) ...

# --- Autostart Home Base on TTY Login ---
# This logic checks for the very specific circumstances of an autologin.

# We check if we are in an interactive shell (-n "$PS1"), on a physical TTY,
# and not inside an existing graphical session (-z "$DISPLAY").
if [ -n "$PS1" ] && [ -z "$DISPLAY" ] && [[ "$(tty)" == /dev/tty* ]]; then

  # We also check if we are the specific user configured for autologin.
  # This prevents trapping an admin who logs into another TTY manually.
  if [ "$USER" = "user" ]; then
    # The 'exec' command REPLACES the shell process with our session.
    # When the session is closed, the TTY will correctly log out.
    exec /opt/ntntnl/libexec/intentional-session
  fi
fi
