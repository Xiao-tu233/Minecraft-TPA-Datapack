#! Migrate the legacy Warp list from dim/Dimension to dimension.
#
# warp[0] is metadata (for example, pages and option_buttons), so the scan
# preserves it verbatim and only normalizes entries starting at warp[1].
execute if data storage tpa:tpa warp[0] run function tpa:update/from_206/warp/prepare
