weight = 41.5

#Ground Shipping#
if weight <= 2:
  ground_per_pound = 1.50
elif weight > 2 and weight <= 6:
  ground_per_pound = 3.00
elif weight > 6 and weight <=10:
  ground_per_pound = 4.00
elif weight > 10:
  ground_per_pound = 4.75
ground_shipping = weight * ground_per_pound + 20.00
final_ground_shipping = round(ground_shipping, 2)
print('Ground shipping price: $',final_ground_shipping)

#Ground Premium Shipping#
premium_shipping = 125.00
print('Premium shipping price: $' , premium_shipping)

#Drone Shipping#
if weight <= 2:
  drone_per_pound = 4.50
elif weight > 2 and weight <= 6:
  drone_per_pound = 9.00
elif weight > 6 and weight <=10:
  drone_per_pound = 12.00
elif weight > 10:
  drone_per_pound = 14.25
drone_shipping = weight * drone_per_pound
final_drone_shipping = round(drone_shipping, 2)
print('Drone shipping = $', final_drone_shipping)
