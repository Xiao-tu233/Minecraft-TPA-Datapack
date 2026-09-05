# Parent Function: tpa:tpa, tpa:back/found, tpa:tpaccept, tpa:tp_pos/act, tpa:home, tpa:warp/act

# \
""" \
  Save the current position as the player's Back location. \
  \
  `capture` reads the current player's position and stores it in \
  `temp.back_candidate`. It only prepares the data and does not modify `back[]`. \
  \
  `upsert` writes `temp.back_candidate` into `back[]`. If an entry for the \
  same player already exists, it replaces that entry; otherwise, it appends \
  a new entry. \
  \
  `set` combines both steps so ordinary callers only need one function. \
""" \

function tpa:back/capture
function tpa:back/upsert