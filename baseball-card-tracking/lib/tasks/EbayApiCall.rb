require 'net/http'
require 'json'

#http://developer.ebay.com/Devzone/finding/CallRef/indec.html
class EbayApiCall
    def find_by_keywords(player, grade_company, grade, year, manufacturer, user_id, save, search_query_id)

    	search_query = player.to_s + " " + grade_company.to_s + " " + grade.to_s + " " + year.to_s + " " + manufacturer.to_s
    	allCards = Array.new
    	results = Array.new
    	count_less_100 = false
    	page_count = 1

    	until count_less_100 == true
	    	urlcomp = "http://svcs.ebay.com/services/search/FindingService/v1?OPERATION-NAME=findCompletedItems&SERVICE-VERSION=1.0.0&SECURITY-APPNAME=#{EBAY_APP_ID_KEY}&RESPONSE-DATA-FORMAT=JSON&paginationInput.pageNumber=#{page_count}&REST-PAYLOAD&categoryId=213&keywords=#{search_query}&descriptionSearch=true"
			resp = Net::HTTP.get_response(URI.parse(urlcomp))
			json_object = JSON.parse(resp.body, :quirks_mode => true)
			count = json_object["findCompletedItemsResponse"][0]["searchResult"][0]["@count"]
			results.push(json_object["findCompletedItemsResponse"][0]["searchResult"][0]["item"])
			if count.to_i == 100
				page_count += 1
			else
				count_less_100 = true
			end
		end

		(0..page_count-1).each do |i|
			results[i].each do |c|
				singleCard = Hash.new
				#user id
				singleCard['user_id'] = user_id
				#search query
				singleCard['searchQueryString'] = player.to_s + " |*| " + grade_company.to_s + " |*| " + grade.to_s + " |*| " + year.to_s + " |*| " + manufacturer.to_s
				#itemId
				singleCard['itemId'] = c['itemId'][0].to_i
				#player
				singleCard['player'] = player
				#brand
				singleCard['brand'] = manufacturer
				#title
				singleCard['title'] = c['title'][0].to_s
				#graded company in title
				graded_q = (c['title'][0].upcase.include? grade_company.upcase) if grade_company != nil
				if graded_q == true
					singleCard['gradeCompany'] = grade_company.upcase.to_s
					singleCard['gradeNumber'] = grade.to_i
				else
					singleCard['gradeCompany'] = nil
					singleCard['gradeNumber'] = nil
				end
				#category info
				singleCard['categoryId'] =  c['primaryCategory'][0]['categoryId'][0].to_i
				singleCard['categoryName'] =  c['primaryCategory'][0]['categoryName'][0].to_s
				#price (currency) converted to USD
				singleCard['currency'] =  c['sellingStatus'][0]['convertedCurrentPrice'][0]['@currencyId'].to_s
				#price (value) converted to USD
				singleCard['price'] =  c['sellingStatus'][0]['convertedCurrentPrice'][0]['__value__'].to_f
				#number of bids
				singleCard['numberBids'] =  c['sellingStatus'][0]['bidCount'][0].to_i if c['sellingStatus'][0]['bidCount'] != nil
				#current status ('active' or...)
				singleCard['sellingState'] =  c['sellingStatus'][0]['sellingState'][0].to_s
				#auction start date and time
				singleCard['startTime'] =  c['listingInfo'][0]['startTime'][0]
				#auction end date and time
				singleCard['endTime'] =  c['listingInfo'][0]['endTime'][0]
				#but it now available
				singleCard['butItNowAvailable'] = c['listingInfo'][0]['buyItNowAvailable'][0].to_s
				#best offer enbled
				singleCard['bestOfferEnabled'] = c['listingInfo'][0]['bestOfferEnabled'][0].to_s
				#listing type (e.g. Auction, StoreInventory)
				singleCard['listingType'] =  c['listingInfo'][0]['listingType'][0].to_s
				#url to ebay page
				singleCard['url'] =  c['viewItemURL'][0].to_s
				#url to image
				singleCard['imageUrl'] =  c['galleryURL'][0].to_s
				#condition if available
				begin
					singleCard['conditionId'] =  c['condition'][0]['conditionId'][0].to_i
					singleCard['conditionDisplayName'] =  c['condition'][0]['conditionDisplayName'][0].to_s
				rescue
					singleCard['conditionId'] = nil
					singleCard['conditionDisplayName'] =  "No_condition_data"
				end
				if save == true && Card.where(itemId: singleCard['itemId']).where(user_id: user_id).count == 0
					card = Card.new(singleCard)
					card.search_query_id = search_query_id
					card.save
				end
				allCards.push(singleCard)
			end
		end
		return allCards
	end
end