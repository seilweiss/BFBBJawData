;nyquist plugin
;version 4
;type process
;name "Generate BFBB Jaw Data..."
;action "Generating BFBB Jaw Data..."
;author "Seil Weiss"
;control maxdB "Mouth open level (dB)" float "" 0 -60 0
;control mindB "Mouth closed level (dB)" float "" -60 -60 0
;control srate "Sample rate (Hz)" int-text "" 60 nil nil

(defun map (x inmin inmax outmin outmax)
	(sum (mult (mult (diff x inmin) (diff outmax outmin)) (recip (diff inmax inmin))) outmin))

(clip (map (mult (resample (s-abs *track*) srate) 2) (db-to-linear mindB) (db-to-linear maxdB) -1 1) 1)