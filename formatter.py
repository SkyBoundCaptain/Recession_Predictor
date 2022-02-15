#####################################################################
# Function: formatter.py
# Author: Chase Nairn-Howard
# Desc & Notes: Takes the raw data in leading_indicators.csv and
# recession_dates, converting it into a format that can be read into
# octave. Does not match the number of datapoints. ie, you will need
# to manually remove some years from the recession_dates_formatted
# and leading_indicators_formatted to have their dimensions match.
# Additionally, any invisible BOMs at the beggining of file will have
# to be manually removed as well. Notepad++ is good for this.
#
# I choose to remove datapoints such that the years I looked at were
# from January 1970 to July 2021.
#
# If you are downloading Recession_Predictor yourself to test it,
# you do not (and should not) run formatter.py since the formatted
# data can already be found in the corresponding "formatted_MYDATA"
# files.
#####################################################################



#######################################
#
#Format the recession data
#
#######################################
#open up recession_dates.csv, read in all lines to a list
rdFile = open("recession_dates.csv")
recessionDates = rdFile.readlines()
rdFile.close()

#go through each line of the list, fixing the format
for line in range(0, len(recessionDates) ):
    #element is one line from recDates.
    #list() used to circumvent immutable strings
    element = list(recessionDates[line]) 

    # replace first "-" with "." in a line. Then, eliminate
    # the second "-" and the 2 char after it 
    # (ie, eliminate the day portion of date)
    char = 0        #start with the first character
    dash = 0        #start with 0 dashes
    while(dash != 2):
        if(element[char] == '-'):
            dash = dash + 1
            if(dash == 2):
                element[char] = ''
                element[char+1] = ''
                element[char+2] = ''
            else:
                element[char] = '.'
        
        char = char + 1

    #place updated format of line back into recessionDates
    recessionDates[line] = ''.join(element)

print(recessionDates)

rdFormattedFile = open("recession_dates_formatted.csv", "w")
rdFormattedFile.writelines(recessionDates)
rdFormattedFile.close()






#######################################
#
#Format the leading indicators data
#
#######################################
#open up leading_indicators.csv, read in all lines to a list
liFile = open("leading_indicators.csv")
leadingIndicators = liFile.readlines()
liFile.close()

#go through each line of the list, fixing the format
for line in range(0, len(leadingIndicators) ):
    #element is one line from recDates.
    #list() used to circumvent immutable strings
    element = list(leadingIndicators[line]) 

    #get rid of second comma (last char of line)
    #if the data point wasn't taken at the time of
    #a business quarter, discard the data point
    char = 0        #start with the first character
    comma = 0       #start with 0 dashes in line
    dot = 0         #start with 0 dots in line

    while( char < len(element) ):

        #get rid of second comma
        if(element[char] == ','):
            comma = comma + 1
            if(comma == 2):
                element[char] = ''
            else:
                element[char] = ','
        else: #it might be a dot
            if(element[char] == '.'):
                dot = dot + 1 #track num of dots on this line
                #"month" will represent a calender month when dot=1
                month = element[char+1] + element[char+2]

                #if we find we aren't in a business quarter...
                if( (month != "01") and (month != "04") 
                and (month != "07") and (month != "10")
                and (dot == 1) ):
                    element = ''    #disregard the element
        
        char = char + 1

    #place updated format of line back into leadingIndicators
    leadingIndicators[line] = ''.join(element)

print(leadingIndicators)

liFormattedFile = open("leading_indicators_formatted.csv", "w")
liFormattedFile.writelines(leadingIndicators)
liFormattedFile.close()
